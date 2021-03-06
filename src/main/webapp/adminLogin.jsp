<%--
  Created by IntelliJ IDEA.
  User: ZB
  Date: 2020/10/12
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员登录</title>
    <link rel="shortcut icon" href="images/login-favicon.ico">
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <script src="js/sweetalert-dev.js"></script>
    <script>
        function refreshCode() {
            var vcode = document.getElementById("vcode");
            vcode.src = "${pageContext.request.contextPath}/checkCodeServlet?"+new Date().getTime();

        }


        function adminlogin() {
            $.ajax({
                type:"post",
                data:$('#loginform').serialize(),
                url:"./adminLoginServlet",
                success:function (data) {
                    if (data == "error"){
                        swal({
                            title:"请输入登录信息"
                        },function () {
                            location = '${pageContext.request.contextPath}/adminLogin.jsp';
                        })
                    }else if (data=="all_error"){
                        swal({
                            title:"管理员用户名密码或验证码错误"
                        },function () {
                            location = '${pageContext.request.contextPath}/adminLogin.jsp';
                        })
                    }
                    else if (data=="verifycode_error"){
                        swal({
                            title:"验证码错误"
                        },function () {
                            location = '${pageContext.request.contextPath}/adminLogin.jsp';
                        })
                    }
                    else if (data=="login_error"){
                        swal({
                            title:"管理员用户名密码错误"
                        },function () {
                            location = '${pageContext.request.contextPath}/adminLogin.jsp';
                        })
                    }else if (data=="login_success") {
                        location = '${pageContext.request.contextPath}/findAllAdminServlet';
                    }
                }
            })
        }


        function ahide() {
            var flag = $('#apassword').attr('type');
            if (flag == "password"){
                $('#apassword').attr("type","text");
            } else {
                $('#apassword').attr("type","password");
            }
        }



        $(function () {
            $("#loginFunChoose").find("li").each(function () {
                var a = $(this).find("a:first")[0];
                if ($(a).attr("href") === location.pathname) {
                    $(this).addClass("active");
                } else {
                    $(this).removeClass("active");
                }
            });
        })
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
<div class="div_mid">
    <div class="container_mid">
        <div class="slogan_mid">
            <img src="images/login_slogan.png" height="429" width="571" class="img_mid"/></div>
        <div class="content_mid">
            <div class="content_menu">
                <ul class="nav nav-pills" id="loginFunChoose">
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/login.jsp" target="_self">用户登录</a></li>
                    <li role="presentation"> <a href="${pageContext.request.contextPath}/adminLogin.jsp" target="_self">管理员登录</a></li>
                </ul>
            </div>
            <form class="form-horizontal" id="loginform" style="margin-left: 30px">
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="text" autocomplete="off" class="form-control" id="aname" name="aname" placeholder="请输入管理员姓名">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10" style="width: 320px">
                        <span class="glyphicon glyphicon-eye-open" style="float: right;margin-top: 10px;margin-right: 30px" aria-hidden="true" id="shide" onclick="ahide()"></span>
                        <input type="password" autocomplete="off" style="width: 238px" class="form-control" id="apassword" name="apassword" placeholder="请输入密码">
                    </div>
                </div>

                <div class="form-group" >
                    <div class="col-sm-10" style="width: 150px">
                        <input type="text" autocomplete="off" class="form-control" id="verifycode" name="verifycode"  placeholder="请输入验证码" style="width: 150px">
                    </div>
                    <div>
                        <a href="javascript:refreshCode()"><img style="margin-left: 30px;width: 74px;height: 34px" src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode"/></a>
                    </div>
                </div>

                <div class="form-group">
                    <div style="width: 320px;margin-left:0; height: 30px" >
                        <button type="button" style="width: 238px;margin-left: 15px"  class="btn btn-default content_imput" id="login" onclick="adminlogin()">登录</button>
                    </div>
                </div>
            </form>

        </div>
    </div>

</div>
<div class="div_footer">
    <div class="div_button">
        <dl>
            <dd>Copyright©2005-2019 xxx药房网（南京）医药科技有限公司版权所有，并保留所有权利。互联网药品交易服务证：京C20160005号</dd>
            <dd>（ICP证、EDI证已二证合一）增值电信业务经营许可证：京B2-20180434</dd>
        </dl>
    </div>
</div>
</body>
</html>