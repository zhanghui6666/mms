<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>药品清单</title>
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

    <div class="container2">
        <form id="form" method="post">
            <table border="1" class="table table-bordered table-hover">
                <tr class="success">
                    <th><input type="checkbox" id="firstCb"></th>
                    <th>编号</th>
                    <th>药名</th>
                    <th>特性</th>
                    <th>作用</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>序号</th>
                    <th>操作</th>
                </tr>

                <c:forEach items="${pb.list}" var="medicine">
                    <tr>
                        <th><input type="checkbox" name="mid" value="${medicine.mid}"></th>
                        <td>${medicine.mno}</td>
                        <td>${medicine.mname}</td>
                        <td>${medicine.mmode}</td>
                        <td>${medicine.mefficacy}</td>
                        <td>${medicine.mprice}</td>
                        <td>${medicine.mnumber}</td>
                        <td>${medicine.mid}</td>
                        <td><a class="btn btn-default btn-sm" href="#">加入购物车</a>&nbsp;
                    </tr>
                </c:forEach>
            </table>
        </form>
        <div>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pb.currentPage == 1}">
                        <li class="disabled">
                    </c:if>

                    <c:if test="${pb.currentPage != 1}">
                        <li>
                    </c:if>



                        <a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${pb.currentPage - 1}&rows=50" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                    <c:forEach begin="1" end="${pb.totalPage}" var="i">

                        <c:if test="${pb.currentPage == i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${i}&rows=50">${i}</a></li>
                        </c:if>

                        <c:if test="${pb.currentPage != i}">
                            <li><a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${i}&rows=50">${i}</a></li>
                        </c:if>

                    </c:forEach>

                    <li>
                        <a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${pb.currentPage + 1}&rows=50" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="container3"></div>
</div>
</body>
</html>