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
    <title>注册</title>
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
            <td class="table_header">
                <span class="span_header">已有账号，</span><a href="login.jsp" class="a_header">快速登录</a>
            </td>
        </tr>
    </table>
</div>
<div class="container">
    <div class="register">
        <div class="content">
            <form action="${pageContext.request.contextPath}/clientRegisterServlet" method="post" id="ajaxForm">
                <h1>
                    <span class="content_span">新用户注册</span>
                </h1>
                <div class="form-group">
                    <label for="cno">账号</label>
                    <input type="text" class="form-control form_group" required="required" id="cno" name="cno" placeholder="请输入您想要注册的账号，最好是以手机号为主" onblur="checkname()">
                    <span id="namespan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="cpassword">密码</label>
                    <input type="password" class="form-control form_group" required="required" id="cpassword" name="cpassword" placeholder="请输入您的密码"  onblur="checkpassword()" >
                    <span id="passwordspan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="cname">姓名</label>
                    <input type="text" class="form-control form_group" required="required"  id="cname" name="cname" placeholder="请输入您的真实姓名" onblur="checkname1()">
                    <span id="name1span" style="color: red"></span>

                </div>
                <div>
                    <label class="radio-inline">
                        <input type="radio" name="csex" id="Csex1" value="男"> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="csex" id="Csex2" value="女"> 女
                    </label>
                </div>
                <div>  <br></div>
                <div class="form-group">
                    <label for="Age">年龄</label>
                    <input type="text" class="form-control form_group" required="required" id="Age" name="cage" placeholder="请输入您的年龄" onblur="checkage()">
                    <span id="agespan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="Address">家庭住址</label>
                    <input type="text" class="form-control form_group" required="required" id="Address"  name="caddress" placeholder="请输入您的家庭住址" onblur="checkaddress()">
                    <span id="addressspan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="Phone">联系方式</label>
                    <input type="text" class="form-control form_group" required="required" id="Phone" name="cphone" placeholder="请输入您的联系方式" onblur="checkphone()">
                    <span id="phonespan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="Symptom">身体状况</label>
                    <input type="text" class="form-control form_group" required="required" id="Symptom"  name="csymptom" placeholder="请输入您的主要症状" onblur="checksymptom()">
                    <span id="symptomspan" style="color: red"></span>
                </div>
                <div class>
                    <select class="form-control form_select" name="cremark">
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
<script>
    function checkname() {
        var cname1 = $("#cno").val()
        console.log(cname1);
        if (cname1 == "") {
            document.getElementById("namespan").innerHTML = "用户名不能为空！";
            return false;
        }
        else {
            document.getElementById("namespan").innerText="";
            return true;
        }
    }

    function checkpassword() {
        var password1 = $("#cpassword").val()
        console.log(password1);
        if (password1 == "") {
            document.getElementById("passwordspan").innerHTML = "密码不能为空！";
            return false;
        } else {
            document.getElementById("passwordspan").innerText = "";
            return true;
        }
    }
    function checkage() {
        var age = $("#Age").val()
        console.log(age);
        if (age == "") {
            document.getElementById("agespan").innerHTML = "年龄不能为空！";
            return false;
        }
        else {
            document.getElementById("agespan").innerText="";
            return true;
        }
    }
    function checkname1() {
        var name1 = $("#cname").val()
        console.log(name1);
        if (name1 == "") {
            document.getElementById("name1span").innerHTML = "姓名不能为空！";
            return false;
        }
        else {
            document.getElementById("name1span").innerText="";
            return true;
        }
    }
    function checkaddress() {
        var address = $("#Address").val()
        console.log(address);
        if (address == "") {
            document.getElementById("addressspan").innerHTML = "家庭住址不能为空！";
            return false;
        }
        else {
            document.getElementById("addressspan").innerText="";
            return true;
        }
    }
    function checkphone() {
        var phone = $("#Phone").val()
        console.log(phone);
        if (phone == "") {
            document.getElementById("phonespan").innerHTML = "联系方式不能为空！";
            return false;
        }
        else {
            document.getElementById("phonespan").innerText="";
            return true;
        }
    }
    function checksymptom() {
        var symptom = $("#Symptom").val()
        console.log(symptom);
        if (symptom == "") {
            document.getElementById("symptomspan").innerText = "具体症状不能为空！";
            return false;
        }
        else {
            document.getElementById("symptomspan").innerText="";
            return true;
        }
    }


    /*alert("注册成功")*/

</script>
</body>
</html>
