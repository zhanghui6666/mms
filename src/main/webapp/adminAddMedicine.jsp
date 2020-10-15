<%--
  Created by IntelliJ IDEA.
  User: 王宇杰
  Date: 2020/10/14
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>药品信息添加</title>
    <link rel="shortcut icon" href="images/login-favicon.ico">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/sweetalert-dev.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/adminMedicineInfo.css">

</head>
<body>
<div>
    <table class="table_header">
        <tr class="tr_header">
            <td class="table_header">
                <img src="images/login_logo.png" height="49" width="334"/>
            </td>
        </tr>
    </table>
</div>
<div class="container">
    <div class="register">
        <div class="content">
            <form action="${pageContext.request.contextPath}/adminAddMedicineServlet">
                <h1>
                    <span class="content_span">药品信息添加</span>
                </h1>
                <div class="form-group">
                    <label for="mno">编号</label>
                    <input type="text" class="form-control form_group" required="required" id="mno" name="mno" placeholder="添加的药品编号" onblur="checkmno()">
                    <span id="mnospan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="mname">药名</label>
                    <input type="password" class="form-control form_group" required="required" id="mname" name="mname" placeholder="请输入药的名称"  onblur="checkmname()" >
                    <span id="mnamespan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="mmode">使用方式</label>
                    <input type="text" class="form-control form_group" required="required"  id="mmode" name="mmode" placeholder="请输入药的使用方式" onblur="checkmmode()">
                    <span id="mmodespan" style="color: red"></span>

                </div>
                <div>  <br></div>
                <div class="form-group">
                    <label for="mefficacy">药效</label>
                    <input type="text" class="form-control form_group" required="required" id="mefficacy" name="mefficacy" placeholder="请输入药效" onblur="checkmefficacy()">
                    <span id="mefficacypan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="mprice">价格</label>
                    <input type="text" class="form-control form_group" required="required" id="mprice"  name="mprice" placeholder="请输入药的价格" onblur="checkmprice()">
                    <span id="mpricespan" style="color: red"></span>
                </div>
                <div class="form-group">
                    <label for="mnumber">库存</label>
                    <input type="text" class="form-control form_group" required="required" id="mnumber" name="mnumber" placeholder="请输入新药的库存" onblur="checkmnumber()">
                    <span id="mnumberspan" style="color: red"></span>
                </div>
                <div>
                    <br>
                    <input type="reset" value="重置" class="btn btn-primary">
                    <input type="submit" value="添加" class="btn btn-primary btn_submit" onclick="submit()">
                    <a href="${pageContext.request.contextPath}/adminControlMedicineServlet"><input type="button" value="返回" class="btn btn-primary" style="margin-left: 50px"></a>
                </div>

            </form>
        </div>
    </div>
</div>
</body>
</html>
<script language="JavaScript">

    function checkmno() {
        var mno = $("#mno").val()
        console.log(mno);
        if (mno == "") {
            document.getElementById("mnospan").innerHTML = "药品编号不能为空！";
            return false;
        }
        else {
            document.getElementById("mnospan").innerText="";
            return true;
        }
    }

    function checkmname() {
        var mname = $("#mname").val()
        console.log(mname);
        if (mname == "") {
            document.getElementById("mnamespan").innerHTML = "药名不能为空！";
            return false;
        } else {
            document.getElementById("mnamespan").innerText = "";
            return true;
        }
    }
    function checkmmode() {
        var mmode = $("#mmode").val()
        console.log(mmode);
        if (mmode == "") {
            document.getElementById("mmodespan").innerHTML = "服用方式不能为空！";
            return false;
        }
        else {
            document.getElementById("mmodespan").innerText="";
            return true;
        }
    }
    function checkmefficacy() {
        var mefficacy = $("#mefficacy").val()
        console.log(mefficacy);
        if (mefficacy == "") {
            document.getElementById("mefficacypan").innerHTML = "疗效不能为空！";
            return false;
        }
        else {
            document.getElementById("mefficacypan").innerText="";
            return true;
        }
    }
    function checkmprice() {
        var mprice = $("#mprice").val()
        console.log(mprice);
        if (mprice == "") {
            document.getElementById("mpricespan").innerHTML = "价格不能为空！";
            return false;
        }
        else {
            document.getElementById("mpricespan").innerText="";
            return true;
        }
    }
    function checkmnumber() {
        var mnumber = $("#mnumber").val()
        console.log(mnumber);
        if (mnumber == "") {
            document.getElementById("mnumberspan").innerHTML = "没有库存还加上干什么！";
            return false;
        }
        else {
            document.getElementById("mnumberspan").innerText="";
            return true;
        }
    }
</script>