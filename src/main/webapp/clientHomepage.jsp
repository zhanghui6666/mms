<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

                <ul class="nav navbar-nav navbar-right barshopcart">
                    <li><a href="${pageContext.request.contextPath}/findShopCartByPageServlet">购物车</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="nav2">
    <div class="logo_container">

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