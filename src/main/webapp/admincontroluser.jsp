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
    <link rel="stylesheet" href="css/controluser.css">

    <script>
        window.onload = function(){
            document.getElementById("topcheckbox").onclick = function () {

                var cbs = document.getElementsByName('cid');
                for (let i = 0; i < cbs.length; i++) {
                    cbs[i].checked = this.checked;
                }

            };
        }
    </script>
</head>
<body>
<div>
    <img src="images/title.png">
</div>
<div id="controlUserMain">
    <div id="controlUserTab">
        <h3>用户信息表</h3>
        <table class="table table-hover">
            <thead>
                <td><input type="checkbox" id="topcheckbox"></td>
                <td>编号</td>
                <td>用户名</td>
                <td>密码</td>
                <td>姓名</td>
                <td>性别</td>
                <td>年龄</td>
                <td>地址</td>
                <td>电话号码</td>
                <td>症状</td>
                <td>注册日期</td>
                <td>状态</td>
                <td>操作</td>
            </thead>
            <tbody id="userbody">
                <c:forEach items="${adminUserInfos}" var="adminUserInfo">
                    <tr>
                        <td><input type="checkbox" name="cid" value="${adminUserInfo.cid}"></td>
                        <td>${adminUserInfo.cid}</td>
                        <td>${adminUserInfo.cno}</td>
                        <td>${adminUserInfo.cpassword}</td>
                        <td>${adminUserInfo.cname}</td>
                        <td>${adminUserInfo.csex}</td>
                        <td>${adminUserInfo.cage}</td>
                        <td>${adminUserInfo.caddress}</td>
                        <td>${adminUserInfo.cphone}</td>
                        <td>${adminUserInfo.csymptom}</td>
                        <td>${adminUserInfo.cdate}</td>
                        <td>${adminUserInfo.cremark}</td>
                        <td><a href="${pageContext.request.contextPath}/adminFindOneUserServlet?cno=${adminUserInfo.cno}" class="btn btn-default btn-primary">编辑</a> &nbsp;&nbsp; / &nbsp;&nbsp; <a href="javascript:void(0)" onclick="del(${adminUserInfo.cno})" class="btn btn-default btn-primary">删除</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div id="controlUserBtn">
        <a href="${pageContext.request.contextPath}/adminchoose.jsp">
            <button type="button" class="btn btn-default" style="width: 200px">返回</button>
        </a>
        <a href="javascript:void(0)" onclick="deleteChoose()">
            <button type="button" class="btn btn-default" style="width: 200px;margin-left: 200px">删除选中</button>
        </a>
    </div>
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
