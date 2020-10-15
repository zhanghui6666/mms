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

    <script>
        window.onload = function(){
            document.getElementById("firstCb").onclick = function () {

                var cbs = document.getElementsByName('mid');
                for (let i = 0; i < cbs.length; i++) {
                    cbs[i].checked = this.checked;
                }

            };
        }
    </script>
</head>
<body>
<div class="nav1">
    <div class="logo_container">
        <form class="form-inline" style="float:right;margin-top: 30px" action="${pageContext.request.contextPath}/findMedicineByPageServlet" method="post">
            <div class="form-group">
                <label for="medicineno">药品编号</label>
                <input type="text" name="mno" value="${condition.mno[0]}" class="form-control" id="medicineno">
            </div>
            <div class="form-group">
                <label for="medicineName">药品名</label>
                <input type="text" name="mname" value="${condition.mname[0]}" class="form-control" id="medicineName">
            </div>
            <div class="form-group">
                <label for="medicineFunction">药品功效</label>
                <input type="text" name="mefficacy" value="${condition.mefficacy[0]}" class="form-control" id="medicineFunction">
            </div>
            <button type="submit" class="btn btn-default" style="margin-left: 30px;margin-right: 10px">查询药品信息</button>
        </form>
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
            <table border="1" class="table table-bordered table-hover" id="tb1">
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

                        <c:if test="${pb.currentPage != 1}">
                        <a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${pb.currentPage - 1}&rows=20&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}" aria-label="Previous">
                        </c:if>

                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>



                        <%--中间页--%>
                        <%--显示6页中间页[begin=起始页,end=最大页]--%>
                        <%--总页数没有6页--%>
                        <c:choose>
                            <c:when test="${pb.totalPage <= 6}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="${page.totalPage}"/>
                            </c:when>
                            <%--页数超过了6页--%>
                            <c:otherwise>
                                <c:set var="begin" value="${pb.currentPage - 1}"/>
                                <c:set var="end" value="${pb.currentPage + 3}"/>
                                <%--如果begin减1后为0,设置起始页为1,最大页为6--%>
                                <c:if test="${begin -1 <= 0}">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="6"/>
                                </c:if>
                                <%--如果end超过最大页,设置起始页=最大页-5--%>
                                <c:if test="${end > pb.totalPage}">
                                    <c:set var="begin" value="${pb.totalPage - 5}"/>
                                    <c:set var="end" value="${pb.totalPage}"/>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                        <%--遍历--%>
                        <c:forEach var="i" begin="${begin}" end="${end}">
                            <%--当前页,选中--%>
                            <c:if test="${pb.currentPage == i}">
                                <li class="active"><a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${i}&rows=50&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}">${i}</a></li>
                            </c:if>

                            <c:if test="${pb.currentPage != i}">
                                <li><a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${i}&rows=50&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}">${i}</a></li>
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





                    <c:if test="${pb.currentPage ==pb.totalPage}">
                        <li class="disabled">
                    </c:if>

                    <c:if test="${pb.currentPage !=pb.totalPage}">
                        <li>
                    </c:if>
                    <c:if test="${pb.currentPage != pb.totalPage}">
                        <a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${pb.currentPage + 1}&rows=20&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}" aria-label="Next">
                    </c:if>
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                        <span style="font-size: 25px;margin-left: 5px;" >
                    共${pb.totalCount}条记录，共${pb.totalPage}页
                </span>
                </ul>
            </nav>
        </div>
    </div>

    <div class="container3"></div>
</div>
</body>
</html>