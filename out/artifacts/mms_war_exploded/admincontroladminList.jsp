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
    <link rel="stylesheet" href="css/controladmin.css">

    <script>
        window.onload = function(){
            document.getElementById("topcheckbox").onclick = function () {

                var cbs = document.getElementsByName('aid');
                for (let i = 0; i < cbs.length; i++) {
                    cbs[i].checked = this.checked;
                }

            };
        }
    </script>
</head>
<body>
<div id="controlAdmintop">
    <img src="images/title.png">
</div>
<div id="controlAdminBg">
    <div id="controlAdminMain">
        <div id="controlAdminTab">
            <table class="table table-hover">
                <thead>
                <td><input type="checkbox" id="topcheckbox"></td>
                <td>编号</td>
                <td>账号</td>
                <td>密码</td>
                <td>操作</td>
                </thead>
                <tbody>
                <c:forEach items="${adminInfos}" var="adminInfo">
                    <tr>
                        <td><input type="checkbox" name="aid" value="${adminInfo.aid}"></td>
                        <td>${adminInfo.aid}</td>
                        <td>${adminInfo.aname}</td>
                        <td>${adminInfo.apassword}</td>
                        <td><a href="${pageContext.request.contextPath}/adminSendAdminServlet?aname=${adminInfo.aname}&apassword=${adminInfo.apassword}" class="btn btn-large btn-primary">改密</a>&nbsp;&nbsp; / &nbsp;&nbsp;<a href="javascript:void(0)" onclick="del(${adminInfo.aid})" class="btn btn-large btn-primary">删除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="controlAdminBtn">
            <a href="${pageContext.request.contextPath}/adminaddadmin.jsp">
                <button type="button" class="btn btn-default" style="width: 200px;margin-left: 300px">添加</button>
            </a>
            <a href="${pageContext.request.contextPath}/adminchoose.jsp">
                <button type="button" class="btn btn-default" style="width: 200px;margin-left: 200px">返回</button>
            </a>
        </div>
    </div>
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
