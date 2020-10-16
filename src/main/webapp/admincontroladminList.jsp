<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 王宇杰
  Date: 2020/10/7
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员信息</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/myclient.css">
   <%-- <link rel="stylesheet" href="css/controladmin.css">--%>

    <script>
        window.onload = function(){
            document.getElementById("topcheckbox").onclick = function () {

                var cbs = document.getElementsByName('aid');
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
                <li role="presentation"><a href="${pageContext.request.contextPath}/adminaddadmin.jsp">添加</a></li>
                <li role="presentation"><a href="javascript:void(0)">删除选中</a></li>
                <li role="presentation" class="dropdown" style="margin-right: 30px">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        <span class="glyphicon glyphicon-circle-arrow-down" aria-hidden="true"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:logout()">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </ul>
    </div>

    <div class="nav2"></div>

    <div class="nav3">
        <div class="container1"></div>
        <div class="container2">
        <div id="controlAdmintop">
            <img src="images/title.png">
        </div>
        <div id="controlAdminBg">
            <div id="controlAdminMain">
                <div id="controlAdminTab">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <td style="width: 10%"><input type="checkbox" id="topcheckbox"></td>
                        <td style="width: 20%">编号</td>
                        <td style="width: 20%">账号</td>
                        <td style="width: 20%">密码</td>
                        <td style="width: 30%">操作</td>
                        </thead>
                        <tbody id="adminbody">
                        <c:forEach items="${adminInfos}" var="adminInfo">
                            <tr>
                                <td><input type="checkbox" name="aid" value="${adminInfo.aid}"></td>
                                <td>${adminInfo.aid}</td>
                                <td>${adminInfo.aname}</td>
                                <td>${adminInfo.apassword}</td>
                                <td style="text-align: center"><a style="margin-right: 30px" href="${pageContext.request.contextPath}/adminSendAdminServlet?aname=${adminInfo.aname}&apassword=${adminInfo.apassword}" class="btn btn-large btn-primary">改密</a>
                                    <a href="javascript:void(0)" onclick="del(${adminInfo.aid})" class="btn btn-large btn-primary">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        </div>
        <div class="container3"></div>
    </div>

</body>
<%
    String mess = (String) session.getAttribute("message");
    if ("".equals(mess) || mess == null) {
    } else {
%>
<script>
    $(function () {
        swal("<%=mess%>");
    })
</script>
<%
    }
    session.setAttribute("message", "");
%>

<%
    String updatemess = (String) session.getAttribute("updateAdminMessage");
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
    session.setAttribute("updateAdminMessage", "");
%>

<%
    String deleteemess = (String) session.getAttribute("deleteAdminMessage");
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
    session.setAttribute("deleteAdminMessage", "");
%>


<script>
    function del(aid){
        swal({
            title: "确定删除吗？",
            text: "你将无法恢复这个管理员！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定删除！",
            cancelButtonText: "取消删除！",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function (isConfirm) {
            if (isConfirm) {
                location="${pageContext.request.contextPath}/deleteAdminServlet?aid="+aid;
            } else {
                swal("取消！", "该管理员现在安全了:)", "error");
            }
        });
    }
    function deleteChoose() {
        swal({
            title: "确定删除吗？",
            text: "你将无法恢复这些管理员！",
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
                swal("取消！", "这些管理员现在安全了:)", "error");
            }
        });
    }
    function deletechoose() {
        var checkeds=$("#adminbody :checked");
        var adminlist=[];
        $.each(checkeds,function (i,n) {
            n=$(n)
            var child=n.parents("tr").children();
            var ano=child.eq(1).text();
            adminlist.push(ano);
        })
        location="adminDeleteChooseAdminServlet?anos="+adminlist;
    }
   /* $(function () {
        $(".btn").click(function () {
            swal({
                title: "确定删除吗？",
                text: "你将无法恢复该虚拟文件！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定删除！",
                cancelButtonText: "取消删除！",
                closeOnConfirm: false,
                closeOnCancel: false
            }, function (isConfirm) {
                if (isConfirm) {
                    swal("删除！", "你的虚拟文件已经被删除。", "success");
                    location="${pageContext.request.contextPath}/deleteAdminServlet";
                } else {
                    swal("取消！", "你的虚拟文件是安全的:)", "error");
                }
            });
        })
    })*/
</script>
</html>
