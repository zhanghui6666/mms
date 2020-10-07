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
<body>
    <div class="nav1">
        <div class="logo_container">
            <img src="images/title.png">
        </div>
    </div>

    <div class="nav2">
        <div id="function">
            <a class="btn btn-default" href="homepage.jsp" role="button">首页</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/findMedicineByPageServlet" role="button">药品大全</a>
            <a class="btn btn-default" href="pharmacy.jsp" role="button">药店</a>
        </div>
    </div>


    <div class="nav3">

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

</body>
</html>