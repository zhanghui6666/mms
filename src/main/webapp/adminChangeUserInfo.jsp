<%@ page import="com.czu.domain.AdminUserInfo" %><%--
  Created by IntelliJ IDEA.
  User: 王宇杰
  Date: 2020/10/12
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑信息</title>
    <link rel="shortcut icon" href="images/login-favicon.ico">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/sweetalert-dev.js"></script>
    <script src="js/bootstrap.js"></script>

    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/adminChangeUserInfo.css">
</head>
<%
    AdminUserInfo adminUserInfo = (AdminUserInfo) request.getAttribute("adminUserInfo");
%>
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
            <form method="post" action="${pageContext.request.contextPath}/adminUpdateUserServlet">
                <h1>
                    <span class="content_span">用户信息修改</span>
                </h1>
                <div class="form-group">
                    <label for="Cno">账号(不可修改)</label>
                    <input type="text" class="form-control form_group" required="required" id="Cno" readonly="readonly"
                           value="<%= adminUserInfo.getCno()%>" name="cno" onblur="checkno()">
                    <span id="nospan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="Password">密码</label>
                    <input type="text" class="form-control form_group" required="required" id="Password"
                           placeholder="请输入您的密码" onblur="checkpassword()" value="<%= adminUserInfo.getCpassword()%>" name="cpassword">
                    <span id="passwordspan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="Cname">姓名</label>
                    <input type="text" class="form-control form_group" required="required" id="Cname"
                           placeholder="请输入您的真实姓名" value="<%= adminUserInfo.getCname()%>" name="cname" onblur="checkname()"><br>
                    <span id="namespan" style="color: red"></span>
                </div>
                <div>
                    <%
                        if (adminUserInfo.getCsex().equals("男")) {
                    %>
                    <label class="radio-inline">
                        <input type="radio" name="csex" value="男" checked="true"> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="csex" value="女"> 女
                    </label>
                    <%
                    } else {
                    %>
                    <label class="radio-inline">
                        <input type="radio" name="csex" value="男"> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="csex" value="女" checked="true"> 女
                    </label>
                    <%
                        }
                    %>
                </div>
                <div><br></div>
                <div class="form-group">
                    <label for="Age">年龄</label>
                    <input type="text" class="form-control form_group" required="required" id="Age"
                           placeholder="请输入您的年龄" value="<%= adminUserInfo.getCage()%>" name="cage" onblur="checkage()">
                    <span id="agespan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="Address">家庭住址</label>
                    <input type="text" class="form-control form_group" required="required" id="Address"
                           placeholder="请输入您的家庭住址" value="<%= adminUserInfo.getCaddress()%>" name="caddress" onblur="checkaddress()">
                    <span id="addressspan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="Phone">联系方式</label>
                    <input type="text" class="form-control form_group" required="required" id="Phone"
                           placeholder="请输入您的联系方式" value="<%= adminUserInfo.getCphone()%>" name="cphone" onblur="checkphone()">
                    <span id="phonespan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="Symptom">身体状况</label>
                    <input type="text" class="form-control form_group" required="required" id="Symptom"
                           placeholder="请输入您的主要症状" value="<%= adminUserInfo.getCsymptom()%>" name="csymptom" onblur="checksymptom()">
                    <span id="symptomspan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="date">注册日期</label>
                    <input type="text" class="form-control form_group" required="required" id="date" readonly="readonly"
                           placeholder="请输入您的出生日期" value="<%= adminUserInfo.getCdate()%>" name="cdate">
                </div>
                <div class>
                    <input type="text" class="form-control form_group" required="required" id="remark"
                           placeholder="是否要治疗" value="<%= adminUserInfo.getCremark()%>" name="cremark">
                </div>
                <div>
                    <br>
                    <input type="reset" value="消去修改" class="btn btn-primary">
                    <input type="submit" value="修改" class="btn btn-primary btn_submit" name="cid">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script language="JavaScript">

    function checkno() {
        var cname1 = $("#cno").val()
        console.log(cname1);
        if (cname1 == "") {
            document.getElementById("nospan").innerHTML = "用户名不能为空！";
            return false;
        }
        else {
            document.getElementById("nospan").innerText="";
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
    function checkname() {
        var name1 = $("#cname").val()
        console.log(name1);
        if (name1 == "") {
            document.getElementById("namespan").innerHTML = "姓名不能为空！";
            return false;
        }
        else {
            document.getElementById("namespan").innerText="";
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
</script>