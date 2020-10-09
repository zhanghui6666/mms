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
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/controladmin.css">
</head>
<body>
    <div id="controlAdminBg">
        <div id="controlAdminMain">
            <div id="controlAdminTab">
                <table class="table table-hover">
                        <thead>
                        <td><input type="checkbox" id="topcheckbox"></td>
                        <td>编号</td>
                        <td>账号</td>
                        <td>密码</td>
                        <td>权限</td>
                        <td>操作</td>
                        </thead>
                    <tbody>
                        <c:forEach items="${adminInfos}" var="adminInfo">
                            <tr>
                                <td><input type="checkbox" name="aid" value="${adminInfo.aid}"></td>
                                <td>${adminInfo.aid}</td>
                                <td>${adminInfo.aname}</td>
                                <td>${adminInfo.apassword}</td>
                                <td>${adminInfo.aaccess}</td>
                                <td><a href="#" class="btn btn-large btn-primary">删除</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div id="controlAdminBtn">
                <button type="button" class="btn btn-default" style="width: 200px;margin-left: 300px">添加</button>
                <button type="button" class="btn btn-default" style="width: 200px;margin-left: 200px">返回</button>
            </div>
        </div>
    </div>
</body>
</html>
