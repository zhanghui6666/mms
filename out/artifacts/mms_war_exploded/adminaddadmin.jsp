<%--
  Created by IntelliJ IDEA.
  User: 王宇杰
  Date: 2020/10/9
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加管理员</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/addadmin.css">
</head>
<body>
<div id="addadminbody">
    <div id="addtab">
        <form method="post" action="${pageContext.request.contextPath}/addAdminServlet">
            <div class="form-group">
                <label for="aname">账号</label>
                <input type="text" class="form-control" id="aname" name="aname" placeholder="输入要添加的管理员的账号">
            </div>
            <div class="form-group">
                <label for="apassword">密码</label>
                <input type="text" class="form-control" id="apassword" name="apassword" placeholder="输入要添加的管理员的密码">
            </div>
            <button type="submit" class="btn btn-default">提交</button>
            <button type="reset" class="btn btn-default">清空</button>
            <a href="${pageContext.request.contextPath}/findAllAdminServlet"><button type="button" class="btn btn-default">返回</button></a>
        </form>
    </div>
</div>
</body>
</html>
