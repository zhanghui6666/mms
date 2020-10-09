<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="shortcut icon" href="images/login-favicon.ico">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/register.css">

    <script>
        function submit() {
            swal("干得漂亮！", "你点击了按钮！", "success")
        }
    </script>
</head>
<body>
<div>
    <table class="table_header">
        <tr class="tr_header">
            <td class="table_header">
                <img src="images/login_logo.png" height="49" width="334"/></td>
            <td class="table_header">
                <span class="span_header">已有账号，</span><a href="login/login.html" class="a_header">快速登录</a>
            </td>
        </tr>
    </table>
</div>
<div class="container">
    <div class="register">
        <div class="content">
            <form>
                <h1>
                <span class="content_span">新用户注册</span>
                </h1>
                <div class="form-group">
                    <label for="Cno">账号</label>
                    <input type="text" class="form-control form_group" required="required" id="Cno" placeholder="请输入您想要注册的账号，最好是以手机号为主">
                </div>
                <div class="form-group">
                    <label for="Password">密码</label>
                    <input type="password" class="form-control form_group" required="required" id="Password" placeholder="请输入您的密码">
                </div>
                <div class="form-group">
                    <label for="Cname">姓名</label>
                    <input type="text" class="form-control form_group" required="required"  id="Cname" placeholder="请输入您的真实姓名"><br>
                </div>
                <div>
                    <label class="radio-inline">
                        <input type="radio" name="csex" id="Csex1" value="option1"> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="csex" id="Csex2" value="option2"> 女
                    </label>
                </div>
                <div>  <br></div>
                <div class="form-group">
                    <label for="Age">年龄</label>
                    <input type="text" class="form-control form_group" required="required" id="Age" placeholder="请输入您的年龄">
                </div>
                <div class="form-group">
                    <label for="Address">家庭住址</label>
                    <input type="text" class="form-control form_group" required="required" id="Address" placeholder="请输入您的家庭住址">
                </div>
                <div class="form-group">
                    <label for="Phone">联系方式</label>
                    <input type="text" class="form-control form_group" required="required" id="Phone" placeholder="请输入您的联系方式">
                </div>
                <div class="form-group">
                    <label for="Symptom">身体状况</label>
                    <input type="text" class="form-control form_group" required="required" id="Symptom" placeholder="请输入您的主要症状">
                </div>
                <div class="form-group">
                    <label for="date">出生日期</label>
                    <input type="text" class="form-control form_group" required="required" id="date" placeholder="请输入您的出生日期">
                    <input type="button" value="检查出生日期" class="input_button" onclick="checkdate(form)"/>
                </div>
                <div class>
                    <select class="form-control form_select">
                        <option>需要治疗</option>
                        <option>不需要治疗</option>
                    </select>
                </div>
                <div>
                    <br>
                    <input type="reset" value="重置" class="btn btn-primary">
                    <input type="submit" value="注册" class="btn btn-primary btn_submit" onclick="submit()">

                </div>

            </form>
        </div>
    </div>
</div>

</body>

</html>