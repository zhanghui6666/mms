<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>药店清单</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/myclient.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <script src="js/sweetalert-dev.js"></script>

</head>
<body style="padding-top:50px">
<%--复杂查询--%>
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
            <!-- Brand and toggle get grouped for better mobile display -->
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav barfunction">
                    <li class="active"><a href="${pageContext.request.contextPath}/clientHomepage.jsp">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/findMedicineByPageServlet">药品大全</a></li>
                    <li><a href="${pageContext.request.contextPath}/findAgencyByPageServlet">药店</a></li>
                </ul>
                <form class="navbar-form navbar-left" style="margin-left: 150px">
                    <div class="form-group">
                        <input style="width: 200px" type="text" name="ano" class="form-control" id="agencyNo" value="${condition1.ano[0]}" placeholder="药店编号">
                        <input style="width: 200px;margin-left: 20px" type="text" name="aname" class="form-control" value="${condition1.aname[0]}" id="agencyName" placeholder="负责人名">
                        <input style="width: 200px;margin-left: 20px" type="text" name="aremark" class="form-control" value="${condition1.aremark[0]}" id="agencyRemark" placeholder="药店名">
                    </div>
                    <button type="submit" style="margin-left: 20px;color: black" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                </form>
                <ul class="nav navbar-nav navbar-right barshopcart">
                    <li><a href="${pageContext.request.contextPath}/findShopCartByPageServlet">购物车</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>



<div class="nav2">
    <div class="logo_container">
       <%-- <form class="form-inline" style="float:right;margin-top:30px" action="${pageContext.request.contextPath}/findAgencyByPageServlet" method="post">
            <div class="form-group">
                <label for="agencyNo">药店编号</label>
                <input style="width: 150px" type="text" name="ano" value="${condition1.ano[0]}" class="form-control" id="agencyNo">
            </div>
            <div class="form-group">
                <label for="agencyName">药店负责人姓名</label>
                <input style="width: 150px" type="text" name="mname" value="${condition1.aname[0]}" class="form-control" id="agencyName">
            </div>
            <div class="form-group">
                <label for="agencyRemark">药店名</label>
                <input style="width: 150px" type="text" name="mefficacy" value="${condition1.aremark[0]}" class="form-control"
                       id="agencyRemark">
            </div>
            <button type="submit" class="btn btn-default" style="margin-left: 30px;margin-right: 10px">查询药店信息</button>
        </form>--%>
        <img src="images/title.png">
    </div>
</div>



<div class="nav3">

    <div class="container1"></div>

    <%--获取数据--%>
    <div class="container2">
        <form id="form" method="post">
            <div class="table-responsive">
                <table border="1" class="table table-bordered table-hover  table-condensed" id="tb1" style="width: 100%;
            table-layout: fixed;">
                    <tr class="success">
                        <th style="width:20%">编号</th>
                        <th style="width:20%">负责人名</th>
                        <th style="width:10%">性别</th>
                        <th style="width:20%">联系方式</th>
                        <th style="width:20%">药店名</th>
                        <th style="width:10%">序号</th>
                    </tr>

                    <c:forEach items="${pb1.list}" var="agency">
                        <tr>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${agency.ano}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${agency.aname}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${agency.asex}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${agency.aphone}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${agency.aremark}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${agency.aid}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </form>

        <%--分页--%>
        <div style="float: left">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pb1.currentPage == 1}">
                    <li class="disabled">
                        </c:if>

                        <c:if test="${pb1.currentPage != 1}">
                    <li>
                        </c:if>

                        <c:if test="${pb1.currentPage != 1}">
                        <a href="${pageContext.request.contextPath}/findAgencyByPageServlet?currentPage=${pb1.currentPage - 1}&rows=20&mno=${condition1.ano[0]}&mname=${condition1.aname[0]}&mefficacy=${condition1.aremark[0]}" aria-label="Previous">
                            </c:if>

                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                    <%--中间页--%>
                    <%--显示6页中间页[begin=起始页,end=最大页]--%>
                    <%--总页数没有6页--%>
                    <c:choose>
                        <c:when test="${pb1.totalPage <= 6}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${pb1.totalPage}"/>
                        </c:when>
                        <%--页数超过了6页--%>
                        <c:otherwise>
                            <c:set var="begin" value="${pb1.currentPage - 1}"/>
                            <c:set var="end" value="${pb1.currentPage + 3}"/>
                            <%--如果begin减1后为0,设置起始页为1,最大页为6--%>
                            <c:if test="${begin -1 <= 0}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="6"/>
                            </c:if>
                            <%--如果end超过最大页,设置起始页=最大页-5--%>
                            <c:if test="${end > pb1.totalPage}">
                                <c:set var="begin" value="${pb1.totalPage - 5}"/>
                                <c:set var="end" value="${pb1.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    <%--遍历--%>
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <%--当前页,选中--%>
                        <c:if test="${pb1.currentPage == i}">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/findAgencyByPageServlet?currentPage=${i}&rows=20&mno=${condition.ano[0]}&mname=${condition.aname[0]}&mefficacy=${condition.aremark[0]}">${i}</a>
                            </li>
                        </c:if>

                        <c:if test="${pb1.currentPage != i}">
                            <li>
                                <a href="${pageContext.request.contextPath}/findAgencyByPageServlet?currentPage=${i}&rows=20&mno=${condition1.ano[0]}&mname=${condition1.aname[0]}&mefficacy=${condition1.aremark[0]}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <%--<c:forEach begin="1" end="${pb.totalPage}" var="i">

                        <c:if test="${pb.currentPage == i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${i}&rows=50&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}">${i}</a></li>
                        </c:if>

                        <c:if test="${pb.currentPage != i}">
                            <li><a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${i}&rows=50&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}">${i}</a></li>
                        </c:if>
                    </c:forEach>--%>

                    <c:if test="${pb1.currentPage ==pb1.totalPage}">
                    <li class="disabled">
                        </c:if>

                        <c:if test="${pb1.currentPage !=pb1.totalPage}">
                    <li>
                        </c:if>
                        <c:if test="${pb1.currentPage != pb1.totalPage}">
                        <a href="${pageContext.request.contextPath}/findAgencyByPageServlet?currentPage=${pb1.currentPage + 1}&rows=20&mno=${condition1.mno[0]}&mname=${condition1.mname[0]}&mefficacy=${condition1.mefficacy[0]}"
                           aria-label="Next">
                            </c:if>
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <%--跳转指定页数--%>
        <div style="float: right;margin-top: 22px;">
            <div class="jump" style="float: left">
                <div class="page-jump">
                    <div class="input-group">
                        <input type="text" class="form-control" id="pageCode" name="pageCode" value="${pb1.currentPage}" style="width:100px">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="submit" onclick="_go()" style="background: black">Go!</button>
                        </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>

            <%--总页数--%>
            <div style="float: left;">
                <span style="font-size: 25px;margin-left: 20px; float: left">
                    共${pb1.totalCount}条记录，共${pb1.totalPage}页
                </span>
            </div>
        </div>
    </div>
    <div class="container3"></div>
</div>
<script>
    function _go() {
        var pc = $("#pageCode").val();//获取文本框中的当前页码
        if(!/^[1-9]\d*$/.test(pc)) {//对当前页码进行整数校验
            swal("请输入正确的页码");
            return;
        }
        if(pc > ${pb1.totalPage}) {//判断当前页码是否大于最大页
            swal("页码太大啦!");
            return;
        }
        location = "${pageContext.request.contextPath}/findAgencyByPageServlet?currentPage="+pc;
    }

  /*  $("#function li").click(function(){
        $("#function li").removeClass("active");
        $(this).addClass("active");
    })*/


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