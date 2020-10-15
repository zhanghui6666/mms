<%--
  Created by IntelliJ IDEA.
  User: 王宇杰
  Date: 2020/10/7
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员功能选择</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/admin.css">
</head>
<body>
<div id="bg">
    <div id="choose">
        <h2 style="color: #2aabd2">请选择你的操作</h2>
        <a href="${pageContext.request.contextPath}/findAllAdminServlet"><input class="btn btn-default" type="button" value="管理员信息管理" style="width: 200px;margin-top: 50px" ></a>
        <br/>
        <a href="${pageContext.request.contextPath}/findAllUserServlet"><input class="btn btn-default" type="button" value="用户信息管理" style="width: 200px;margin-top: 50px"></a>
        <br/>
        <a href="${pageContext.request.contextPath}/adminControlMedicineServlet"><input class="btn btn-default" type="button" value="仓库管理" style="width: 200px;margin-top: 50px"></a>
    </div>
</div>
</body>
</html>
