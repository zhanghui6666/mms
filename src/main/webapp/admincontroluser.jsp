<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 王宇杰
  Date: 2020/10/12
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户信息</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/myclient.css">
   <%-- <link rel="stylesheet" href="css/controluser.css">
--%>
    <script>
        window.onload = function(){
            document.getElementById("topcheckbox").onclick = function () {

                var cbs = document.getElementsByName('cid');
                for (let i = 0; i < cbs.length; i++) {
                    cbs[i].checked = this.checked;
                }

            };
        }

        $(function () {
            $("#adminFunChoose").find("li").each(function () {
                var a = $(this).find("a:first")[0];
                if ($(a).attr("href") === location.pathname) {
                    $(this).addClass("active");
                } else {
                    $(this).removeClass("active");
                }
            });
        })
    </script>
</head>
<body>
<div class="nav1">
    <ul class="nav nav-tabs" id="adminFunChoose">
    <ul class="nav nav-tabs">
    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/findAllAdminServlet#">管理员信息管理</a></li>
    <li role="presentation"><a href="${pageContext.request.contextPath}/findAllUserServlet">用户信息管理</a></li>
    <li role="presentation"><a href="${pageContext.request.contextPath}/adminControlMedicineServlet">仓库管理</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li role="presentation"><a href="javascript:void(0)" onclick="deleteChoose()">删除选中</a></li>
        <li role="presentation" class="dropdown" style="margin-right: 30px">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <span class="glyphicon glyphicon-circle-arrow-down" aria-hidden="true"></span>
            </a>

            <ul class="dropdown-menu">
                <li><a href="javascript:logout()">退出登录</a></li>
            </ul>
        </li>
    </ul>

</ul></div>


<div class="nav2">
    <div class="logo_container">
        <img src="images/title.png">
    </div>
</div>


<div class="nav3">
    <div class="container1"></div>

    <div class="container2">
        <div id="controlUserMain">
            <div id="controlUserTab">
                <table border="1" class="table table-bordered table-hover table-condensed" id="tb1" style="width: 99%;table-layout: fixed;">
                    <thead>
                    <td style="width:2%"><input type="checkbox" id="topcheckbox"></td>
                    <td style="width:3%" >编号</td>
                    <td style="width:7%">用户名</td>
                    <td style="width:7%">密码</td>
                    <td style="width:5%">姓名</td>
                    <td style="width:4%">性别</td>
                    <td style="width:5%">年龄</td>
                    <td style="width:10%">地址</td>
                    <td style="width:10%">电话号码</td>
                    <td style="width:10%">症状</td>
                    <td style="width:12%">注册日期</td>
                    <td style="width:11%">状态</td>
                    <td style="width:14%">操作</td>
                    </thead>
                    <tbody id="userbody">
                    <c:forEach items="${adminUserInfos}" var="adminUserInfo">
                        <tr>
                            <td><input type="checkbox" name="cid" value="${adminUserInfo.cid}"></td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.cid}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.cno}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.cpassword}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.cname}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.csex}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.cage}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.caddress}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.cphone}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.csymptom}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.cdate}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${adminUserInfo.cremark}</td>
                            <td style="text-align: center"><a style="margin-right: 10px" href="${pageContext.request.contextPath}/adminFindOneUserServlet?cno=${adminUserInfo.cno}" class="btn btn-primary">编辑</a>
                                <a href="javascript:void(0)" onclick="del(${adminUserInfo.cno})" class="btn btn-primary">删除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="container3"></div>
</div>





</body>

<%
    String updatemess = (String) session.getAttribute("updateUserMessage");
    if ("".equals(updatemess) || updatemess == null) {
    } else {
%>
<script>
    $(function () {
        swal("<%=updatemess%>");
    })
</script>
<%
    }
    session.setAttribute("updateUserMessage", "");
%>

<%
    String deleteemess = (String) session.getAttribute("deleteUserMessage");
    if ("".equals(deleteemess) || deleteemess == null) {
    } else {
%>
<script>
    $(function () {
        swal("<%=deleteemess%>");
    })
</script>
<%
    }
    session.setAttribute("deleteUserMessage", "");
%>


<script>
    function del(cno){
        swal({
            title: "确定删除吗？",
            text: "你将无法恢复这个用户！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定删除！",
            cancelButtonText: "取消删除！",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function (isConfirm) {
            if (isConfirm) {

                location="${pageContext.request.contextPath}/adminDeleteUserServlet?cno="+cno;
            } else {
                swal("取消！", "这个用户现在安全了:)", "error");
            }
        });
    }

    function deleteChoose() {
        swal({
            title: "确定删除吗？",
            text: "你将无法恢复这些用户！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定删除！",
            cancelButtonText: "取消删除！",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function (isConfirm) {
            if (isConfirm) {
                deletechoose()
            } else {
                swal("取消！", "这些用户现在安全了:)", "error");
            }
        });
    }
    function deletechoose() {
        var checkeds=$("#userbody :checked");
        var userlist=[];
        $.each(checkeds,function (i,n) {
            n=$(n)
            var child=n.parents("tr").children();
            var ano=child.eq(2).text();
            userlist.push(ano);
        })
        location="adminDeleteChooseUserServlet?cnos="+userlist;
    }
</script>
</html>
