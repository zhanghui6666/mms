<%--
  Created by IntelliJ IDEA.
  User: ZB
  Date: 2020/10/7
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
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



        function clientlogin() {
            $.ajax({
                type:"post",
                data:$('#loginform').serialize(),
                url:"./clientLoginServlet",
                success:function (data) {
                    if (data == "error"){
                        swal({
                            title:"请输入登录信息"
                        },function () {
                            location = '${pageContext.request.contextPath}/login.jsp';
                        })
                    }else if (data=="all_error"){
                        swal({
                            title:"账号密码或验证码错误"
                        },function () {
                            location = '${pageContext.request.contextPath}/login.jsp';
                        })
                    }
                    else if (data=="verifycode_error"){
                        swal({
                            title:"验证码错误"
                        },function () {
                            location = '${pageContext.request.contextPath}/login.jsp';
                        })
                    }
                    else if (data=="login_error"){
                        swal({
                            title:"账号密码错误"
                        },function () {
                           location = '${pageContext.request.contextPath}/login.jsp';
                        })
                    }else if (data=="login_success") {
                        location = '${pageContext.request.contextPath}/clientHomepage.jsp';
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
            <td class="table_header">
                <span class="span_header">新用户，</span><a href="regist.jsp" class="a_header">快速注册</a>
            </td>
        </tr>
    </table>
</div>
<div class="div_mid">
    <div class="container_mid">
        <div class="slogan_mid">
            <img src="images/login_slogan.png" height="429" width="571" class="img_mid"/></div>
        <div class="content_mid">
            <div class="content_menu" >
                <ul class="menu_ul">
                    <li id="li1" class="menu_li1" style="float: left">
                        <a href="login.jsp" target="bt1">用户登录</a>
                    </li>
                    <li id="li2" class="menu_li2" >
                        <a href="adminLogin.jsp " target="bt1">管理员登录</a>
                    </li>
                </ul>
            </div>

            <form class="form-horizontal" id="loginform" style="margin-left: 30px">
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="cno" name="cno" placeholder="请输入账号">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="请输入密码">
                    </div>
                </div>

                <div class="form-group" >
                    <div class="col-sm-10" style="width: 150px">
                        <input type="text" class="form-control" id="verifycode" name="verifycode"  placeholder="请输入验证码" style="width: 150px">
                    </div>
                    <div>
                        <a href="javascript:refreshCode()"><img style="margin-left: 30px;width: 74px;height: 34px" src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode"/></a>
                    </div>
                </div>

                <div class="form-group">
                    <div style="width: 320px;margin-left:0; height: 30px">
                        <button type="button" style="width: 150px;margin-left: 15px" class="btn btn-default content_imput" id="login" onclick="clientlogin()">登录</button>
                    </div>
                    <div>
                    <a href="${pageContext.request.contextPath}/forget.jsp" style="margin-left: 10px;margin-top:10px;height: 10px">忘记密码</a>
                    <a href="${pageContext.request.contextPath}/modify.jsp" style="margin-left: 10px;margin-top:10px;height: 10px">修改密码</a>
                    </div>
                </div>
            </form>

            <div class="other_login">
                <span class="other_span">您还可以通过以下方式登录：</span>
                <a href="www.qq.com"><img src="images/other_qq.jpg" class="other_qq"></a>
                <a href="#"><img src="images/other_weixin.jpg" class="other_weixin"> </a>
            </div>
            <!--<div class="form-group">
                <label for="exampleInputEmail1"> 用户编号</label>
                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>-->

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

<%--
<script>alert('注册成功即将跳转到登录界面!')</script>--%>
