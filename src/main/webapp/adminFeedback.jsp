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
    <title>用户反馈</title>
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


        function logout(){
            swal({
                    title: "确定退出吗？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定退出！",
                    closeOnConfirm: false
                },
                function(){
                    location = "${pageContext.request.contextPath}/adminLogoutServlet";
                });
        }
    </script>
</head>
<body style="padding-top:50px">

<div class="nav1">
    <nav class="navbar navbar-default navbar-fixed-top">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav nav-tabs" id="adminFunChoose">
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/findAllAdminServlet">管理员信息管理</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/findAllUserServlet">用户信息管理</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/adminControlMedicineServlet">仓库管理</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/adminFeedbackServlet">用户反馈</a></li>

                <ul class="nav navbar-nav navbar-right">
                    <li role="presentation"><a href="javascript:void(0)" onclick="deleteChoose()">删除选中</a></li>
                    <li class="dropdown" style="margin-right: 30px;margin-top:3px">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a href="javascript:logout()">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </ul>
            </div>
        </div>
    </nav>

</div>


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
                    <td style="width:2%"><input type="checkbox" id="topcheckbox" class="feedbackcheck"></td>
                    <td style="width:3%" >序号</td>
                    <td style="width:5%" >反馈号</td>
                    <td style="width:15%">用户账号</td>
                    <td style="width:15%">用户名</td>
                    <td style="width:40%">反馈信息</td>
                    <td style="width:20%">操作</td>

                    </thead>
                    <c:forEach items="${feedBacks}" var="feedBacks" varStatus="status">
                        <tr>
                            <td><input type="checkbox" name="cid" value="${status.index+1}" class="feedbackcheck"></td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${status.index+1}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${feedBacks.fid}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${feedBacks.cno}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${feedBacks.cname}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${feedBacks.ctext}</td>
                            <td style="text-align: center"><a href="javascript:void(0)" onclick="del(${feedBacks.fid})" class="btn btn-primary">删除</a></td>
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
    function del(fid){
        swal({
            title: "确定删除吗？",
            text: "你将无法恢复这个反馈！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定删除！",
            cancelButtonText: "取消删除！",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function (isConfirm) {
            if (isConfirm) {

                location="${pageContext.request.contextPath}/adminDeleteFeedbackServlet?fid="+fid;
            } else {
                swal("取消！", "取消成功", "error");
            }
        });
    }

    function deleteChoose() {
        var checked = $("input[class='feedbackcheck']:checked");
        if (checked.length==0){
            swal("请至少选择一个")
        }else{
            swal({
                title: "确定删除吗？",
                text: "你将无法恢复这些反馈！",
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
                    swal("取消！", "取消成功", "error");
                }
            });
        }

    }
    function deletechoose() {
        var checkeds=$("input[name='cid']:checked");
        var fids=[];
        $.each(checkeds,function (i,n) {
            n=$(n)
            var child=n.parents("tr").children();
            var ano=child.eq(2).text();
            fids.push(ano);
        })
        location="adminDeleteChooseFeedbackServlet?fids="+fids;
    }
</script>
</html>
