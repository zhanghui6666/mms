<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>医药管理系统</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/myclient.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <script src="js/sweetalert-dev.js"></script>
    <style>
        .title {
            font-family: "Arial","Microsoft YaHei","黑体","宋体",sans-serif;
        }
    </style>
    <script>
        function feedbackreg() {
            var ctext = $(".ctext").val();
            var reg = /^\s*$/
            if (ctext != null && ctext != undefined && !reg.test(ctext)){
                $.ajax({
                    url: "./feedbackServlet",
                    type: "post",
                    data: $('#feedbackForm').serialize(),
                    success:function () {
                        window.location.reload();
                    }
                });
            }else {
                swal({
                    title: "写点什么吧！"
                },function () {
                    window.location.reload();
                })
            }
        }
    </script>
</head>
<body style="padding-top:50px">
<div class="nav1">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav barfunction">
                    <li class="active"><a href="${pageContext.request.contextPath}/clientHomepage.jsp">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/findMedicineByPageServlet">药品大全</a></li>
                    <li><a href="${pageContext.request.contextPath}/findAgencyByPageServlet">药店</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/findAllOrdersServlet" id="findAllOrders">我的订单</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#myModal" >反馈</a></li>
                            <li><a href="javascript:logout()">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right barshopcart">
                    <li><a href="${pageContext.request.contextPath}/findShopCartByPageServlet">购物车</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">反馈</h4>
                </div>
                <div class="modal-body">
                    <form  method="post" id="feedbackForm">
                        <div class="input-group">
                            <input type="text" class="form-control ctext" placeholder="反馈信息" autocomplete="off" name="ctext" style="width:500px" aria-describedby="basic-addon1">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="color: black">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="feedbackreg()" data-dismiss="modal">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="nav2">
    <div class="logo_container clearfix">
        <h1 style="float: right;margin-right:500px;" class="title">欢迎回来&nbsp&nbsp${cname}&nbsp!</h1>
        <img src="images/title.png">

    </div>
</div>


<div class="nav3" style="margin-top: 0;">
    <div class="container1"></div>
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img id="img1" src="images/client_back4.jpg">
            </div>
            <div class="item">
                <img id="img2" src="images/client_back2.jpg">
            </div>
            <div class="item">
                <img id="img3" src="images/client_back3.jpg">
            </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="container3"></div>
</div>


<script>
    function logout(){
        swal({
                title: "确定退出吗？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定退出！",
                closeOnConfirm: false
            },
            function(){
                location = "${pageContext.request.contextPath}/logoutServlet";
            });
    }






    $(function () {
        $(".barfunction").find("li").each(function () {
            var a = $(this).find("a:first")[0];
            if ($(a).attr("href") === location.pathname) {
                $(this).addClass("active");
            } else {
                $(this).removeClass("active");
            }
        });
    })


    $(function () {
        $(".barshopcart").find("li").each(function () {
            var a = $(this).find("a:first")[0];
            if ($(a).attr("href") === location.pathname) {
                $(this).addClass("active");
            } else {
                $(this).removeClass("active");
            }
        });
    })
</script>
</body>
</html>