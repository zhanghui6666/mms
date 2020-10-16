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
    <script>
        $(function () {
            var rg1 = false;
            var rg2 = false;
            var rg3 = false;
            var rg4 = false;
            var rg5 = false;
            var rg6 = false;
            var rg7 = false;
            var rg8 = false;

            //校验用户名
            $('input[name="cno"]').blur(function () {
                var msg = $("#namespan");
                var username = $("#cno").val()
                var reg_username = /[a-zA-Z0-9_]{3,16}/;
                var flag = reg_username.test(username);
                console.log(flag)
                if (flag==true) {
                    $.post("./findRepeatServlet",$('#registForm').serialize(),function (data) {
                        if (data== "true"){
                            //重名
                            msg.text("您输入的用户名重复");
                            msg.css("color","red");
                            $("#cno").css("border","1px solid red");

                        }else if (data == "false"){
                            //正确
                            //msg.css=("color","green");
                            msg.css("color","green");
                            msg.text("通过") ;
                            $("#cno").css("border","");
                            rg1 = true;
                        }
                    })
                }
                else if (flag==false) {
                    msg.css("color","red");
                    msg.text("4到16位字母，数字");
                    $("#cno").css("border","1px solid red");
                }

            });

            $('input[name="cpassword"]').blur(function () {
                var msg = $("#cpasswordspan");
                var cpassword = $("#cpassword").val()
                var reg_cpassword = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
                var flag = reg_cpassword.test(cpassword)
                if (flag==true) {
                    msg.css("color","green");
                    msg.text("通过");
                    $("#cpassword").css("border","");
                    rg2 = true;
                } else if (flag==false) {
                    msg.css("color","red");
                    msg.text("最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符");
                    $("#cpassword").css("border","1px solid red");

                }
            });

            $('input[name="spassword"]').blur(function () {
                var msg = $("#spasswordspan");
                var spassword = $("#spassword").val()
                var reg_spassword = /^\w{6,12}$/;
                var flag = reg_spassword.test(spassword)
                if (flag==true) {
                    msg.css("color","green");
                    msg.text("通过");
                    $("#spassword").css("border","");
                    rg3 = true;
                } else if (flag==false) {
                    msg.css("color","red");
                    msg.text("6到12位");
                    $("#spassword").css("border","1px solid red");
                }

            });

            $('input[name="cname"]').blur(function () {
                var msg = $("#cnamespan");
                var cname = $("#cname").val()
                var reg_cname = /[\u4E00-\u9FA5]/;
                var flag = reg_cname.test(cname)
                if (flag==true) {
                    msg.css("color","green");
                    msg.text("通过");
                    $("#cname").css("border","");
                    rg4 = true;
                } else if (flag==false) {
                    msg.css("color","red");
                    msg.text("包含中文");
                    $("#cname").css("border","1px solid red");
                }

            });

            $('input[name="cage"]').blur(function () {
                var msg = $("#cagespan");
                var cage = $("#cage").val()
                var reg_cage = /^(?:[1-9][0-9]?|1[01][0-9]|120)$/;
                var flag = reg_cage.test(cage)
                if (flag==true) {
                    msg.css("color","green");
                    msg.text("通过");
                    $("#cage").css("border","");
                    rg5 = true;
                } else if (flag==false) {
                    msg.css("color","red");
                    msg.text("1到120岁有效");
                    $("#cage").css("border","1px solid red");
                }

            });

            $('input[name="caddress"]').blur(function () {
                var msg = $("#caddressspan");
                var caddress = $("#caddress").val()
                var reg_caddress = /[\u4E00-\u9FA5]/;
                var flag = reg_caddress.test(caddress)
                if (flag==true) {
                    msg.css("color","green");
                    msg.text("通过");
                    $("#caddress").css("border","");
                    rg6 =  true;
                } else if (flag==false) {
                    msg.css("color","red");
                    msg.text("详细地址包含中文");
                    $("#caddress").css("border","1px solid red");
                }

            });

            $('input[name="cphone"]').blur(function () {
                var msg = $("#cphonespan");
                var cphone = $("#cphone").val()
                var reg_cphone = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$/;
                var flag = reg_cphone.test(cphone)
                if (flag==true) {
                    msg.css("color","green");
                    msg.text("通过");
                    $("#cphone").css("border","");
                    rg7 = true;
                } else if (flag==false) {
                    msg.css("color","red");
                    msg.text("请输入正确手机号码");
                    $("#cphone").css("border","1px solid red");
                }

            });

            $('input[name="csymptom"]').blur(function () {
                var msg = $("#csymptomspan");
                var csymptom = $("#csymptom").val()
                var reg_csymptom =  /[\u4E00-\u9FA5]/;
                var flag = reg_csymptom.test(csymptom)
                if (flag==true) {
                    msg.css("color","green");
                    msg.text("通过");
                    $("#csymptom").css("border","");
                    rg8 = true;
                } else if (flag==false) {
                    msg.css("color","red");
                    msg.text("包含中文");
                    $("#csymptom").css("border","1px solid red");
                }

            });

            $('#submit').click(function () {
                if (rg1 && rg2 && rg3 && rg4 && rg5 && rg6 && rg7 && rg8){
                    regist();
                }else {
                    swal("请检查输入是否正确!")
                }
            })
        });

        function regist(){
                $.ajax({
                    url:"./clientRegisterServlet",
                    type:"post",
                    data:$('#registForm').serialize(),
                    success:function (data) {
                        if (data == "success"){
                            swal({
                                title:"注册成功！"
                            },function () {
                                location = "${pageContext.request.contextPath}/login.jsp";
                            })
                        }else if (data == "error"){
                            swal({
                                title: "注册失败",
                                text:"服务器异常。请稍后再试"
                            },function () {
                                location = "${pageContext.request.contextPath}/regist.jsp";
                            })
                        }
                    }
                })
        }

        function chide() {
            var flag = $('#cpassword').attr('type');
            if (flag == "password"){
                $('#cpassword').attr("type","text");
            } else {
                $('#cpassword').attr("type","password");
            }
        }

        function shide() {
            var flag = $('#spassword').attr('type');
            if (flag == "password"){
                $('#spassword').attr("type","text");
            } else {
                $('#spassword').attr("type","password");
            }
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
                <span class="span_header">已有账号，</span><a href="login.jsp" class="a_header">快速登录</a>
            </td>
        </tr>
    </table>
</div>
<div class="container">
    <div class="register">
        <div class="content">
            <form  method="post" id="registForm">
                <h1>
                    <span class="content_span">新用户注册</span>
                </h1>
                <div class="form-group">
                    <div>
                    <label for="cno">账号</label>
                    <div class="row">
                        <div class="col-xs-6 col-sm-3"><input type="text" class="form-control form_group" style="width: 534px" required="required" id="cno" name="cno" placeholder="请输入您想要注册的账号,4到16位字母，数字!">
                        </div>
                        <div class="col-xs-6 col-sm-3" style="margin-left: 270px;margin-top: 10px">
                            <span id="namespan"></span>
                        </div>
                     </div>
                </div>
                </div>
                <div class="form-group">
                    <label for="cpassword">密码</label>
                    <div class="row">
                        <div class="col-xs-6 col-sm-3">
                            <input type="password" class="form-control form_group" style="width: 534px" required="required" id="cpassword" name="cpassword" placeholder="最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符">
                        </div>
                        <div class="col-xs-6 col-sm-3" style="margin-left: 270px;margin-top: 11px;width: 30px">
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true" onclick="chide()"></span>
                        </div>
                        <div class="col-xs-6 col-sm-3" style="width: 500px;margin-top: 10px">
                            <span id="cpasswordspan"></span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="spassword">超级密码</label>
                    <div class="row">
                        <div class="col-xs-6 col-sm-3">
                            <input type="password" class="form-control form_group" style="width: 534px" required="required" id="spassword" name="spassword" placeholder="请输入超级密码，6到12位，用于找回密码">
                        </div>
                        <div class="col-xs-6 col-sm-3" style="margin-left: 270px;margin-top: 11px;width: 30px">
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true" id="shide" onclick="shide()"></span>
                        </div>
                        <div class="col-xs-6 col-sm-3" style="width: 500px;margin-top: 10px">
                            <span id="spasswordspan"></span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="cname">姓名</label>
                    <div class="row">
                        <div class="col-xs-6 col-sm-3">
                            <input type="text" class="form-control form_group" style="width: 534px" required="required" id="cname" name="cname" placeholder="请输入您的真实姓名">
                        </div>
                        <div class="col-xs-6 col-sm-3" style="margin-left: 270px;margin-top: 10px">
                            <span id="cnamespan"></span>
                        </div>
                    </div>
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
                    <label for="cage">年龄</label>
                    <div class="row">
                        <div class="col-xs-6 col-sm-3">
                            <input type="text" class="form-control form_group" style="width: 534px" required="required" id="cage" name="cage" placeholder="请输入您的年龄">
                        </div>
                        <div class="col-xs-6 col-sm-3" style="margin-left: 270px;margin-top: 10px">
                            <span id="cagespan"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="caddress">家庭住址</label>
                    <div class="row">
                        <div class="col-xs-6 col-sm-3">
                            <input type="text" class="form-control form_group" style="width: 534px" required="required" id="caddress" name="caddress" placeholder="请输入您的家庭住址">
                        </div>
                        <div class="col-xs-6 col-sm-3" style="margin-left: 270px;margin-top: 10px">
                            <span id="caddressspan"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cphone">联系方式</label>
                    <div class="row">
                        <div class="col-xs-6 col-sm-3">
                            <input type="text" class="form-control form_group" style="width: 534px" required="required" id="cphone" name="cphone" placeholder="请输入您的联系方式">
                        </div>
                        <div class="col-xs-6 col-sm-3" style="margin-left: 270px;margin-top: 10px">
                            <span id="cphonespan"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="csymptom">身体状况</label>
                    <div class="row">
                        <div class="col-xs-6 col-sm-3">
                            <input type="text" class="form-control form_group" style="width: 534px" required="required" id="csymptom" name="csymptom" placeholder="请输入您的主要症状">
                        </div>
                        <div class="col-xs-6 col-sm-3" style="margin-left: 270px;margin-top: 10px">
                            <span id="csymptomspan"></span>
                        </div>
                    </div>
                </div>
                <div class>
                    <select class="form-control form_select" name="cremark">
                        <option>需要治疗</option>
                        <option>不需要治疗</option>
                    </select>
                </div>
                <div>
                    <br>
                    <input type="button" value="注册" class="btn btn-primary btn_submit" id="submit" >

                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
