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
    <script>

        function findPassword(){
            $.ajax({
                url:"./forgetPasswordServlet",
                type:"post",
                data:$('#forgetForm').serialize(),
                success:function (data) {
                    if (data == "error"){
                        swal({
                            title:"用户名或超级密码输入错误"
                        },function () {
                            location = '${pageContext.request.contextPath}/forget.jsp';
                        })
                    }else if (data == "success"){
                        location = '${pageContext.request.contextPath}/findPassword.jsp';
                    }
                }
            })
        }

    </script>
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
                    <span class="content_span">忘记密码</span>
                </h1>
                <div class="form-group">
                    <label for="cno">账号</label>
                    <input type="text" class="form-control form_group" id="cno" name="cno" placeholder="请输入您想要找回密码的账号">
                </div>

                <div class="form-group">
                    <label for="cno">超级密码</label>
                    <input type="password" class="form-control form_group" id="spassword"  name="spassword" placeholder="请输入超级密码">
                </div>

                <div>
                    <br>
                    <input type="reset" value="重置" class="btn btn-default">
                    <input type="button" value="查找" class="btn  btn-primary content_imput" onclick="findPassword()">
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
