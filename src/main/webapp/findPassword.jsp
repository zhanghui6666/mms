<%--
  Created by IntelliJ IDEA.
  User: ZB
  Date: 2020/10/13
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>忘记密码</title>
    <link rel="shortcut icon" href="images/login-favicon.ico">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/register.css">


</head>
<body>
<div>
    <table class="table_header">
        <tr class="tr_header">
            <td class="table_header">
                <img src="images/login_logo.png" height="49" width="334"/></td>
        </tr>
    </table>
</div>
<div class="container">
    <div class="register">
        <div class="content">
            <form  method="post" id="forgetForm">
                <h1>
                    <span class="content_span">找回密码</span>
                </h1>
                <div class="form-group">
                    <label for="cno">账号</label>
                    <input type="text" class="form-control form_group" disabled="true" required="required" id="cno" name="cno" value="${cno}">
                    <span id="namespan" style="color: red"></span>
                </div>

                <div class="form-group">
                    <label for="cpassword">密码</label>
                    <input type="text" class="form-control form_group" required="required" disabled="true" id="cpassword" value="${cpassword}">
                </div>


                <div>
                    <br>
                    <a type="button" class="btn btn-primary btn_submit" href="javascript:logout()">返回登录</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script>

    function logout(){
        swal({
                title: "确定返回吗？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定返回！",
                closeOnConfirm: false
            },
            function(){
                location = "${pageContext.request.contextPath}/logoutServlet";
            });
    }
</script>
</body>
</html>
