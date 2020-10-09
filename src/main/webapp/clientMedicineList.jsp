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
    <link rel="stylesheet" href="css/sweetalert.css">
    <script src="js/sweetalert-dev.js"></script>

</head>
<body>
<%--复杂查询--%>
<div class="nav1">
    <div class="logo_container">
        <form class="form-inline" style="float:right;margin-top:30px" action="${pageContext.request.contextPath}/findMedicineByPageServlet" method="post">
            <div class="form-group">
                <label for="medicineno">药品编号</label>
                <input style="width: 150px" type="text" name="mno" value="${condition.mno[0]}" class="form-control" id="medicineno">
            </div>
            <div class="form-group">
                <label for="medicineName">药品名</label>
                <input style="width: 150px" type="text" name="mname" value="${condition.mname[0]}" class="form-control" id="medicineName">
            </div>
            <div class="form-group">
                <label for="medicineFunction">药品功效</label>
                <input style="width: 150px" type="text" name="mefficacy" value="${condition.mefficacy[0]}" class="form-control"
                       id="medicineFunction">
            </div>
            <button type="submit" class="btn btn-default" style="margin-left: 30px;margin-right: 10px">查询药品信息</button>
        </form>
        <img src="images/title.png">
    </div>
</div>

<div class="nav2">
    <div id="function">
        <a class="btn btn-default" href="clientHomepage.jsp" role="button">首页</a>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/findMedicineByPageServlet" role="button">药品大全</a>
        <a class="btn btn-default" href="pharmacy.jsp" role="button">药店</a>
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
                        <th style="width:3%"><input type="checkbox" id="firstCb"></th>
                        <th style="width:10%">编号</th>
                        <th style="width:10%">药名</th>
                        <th style="width:5%">特性</th>
                        <th style="width:40%">作用</th>
                        <th style="width:5%">单价</th>
                        <th style="width:5%">数量</th>
                        <th style="width:5%">序号</th>
                        <th style="width:17%">操作</th>
                    </tr>

                    <c:forEach items="${pb.list}" var="medicine">
                        <tr>
                            <th class="wrap"><input type="checkbox" name="mid" value="${medicine.mid}"></th>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${medicine.mno}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${medicine.mname}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${medicine.mmode}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${medicine.mefficacy}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${medicine.mprice}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${medicine.mnumber}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${medicine.mid}</td>
                            <td><a class="btn btn-default" href="#" role="button" style="margin-left: 50px">加入购物车</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </form>

        <%--分页--%>
        <div style="float: left">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pb.currentPage == 1}">
                    <li class="disabled">
                        </c:if>

                        <c:if test="${pb.currentPage != 1}">
                    <li>
                        </c:if>

                        <c:if test="${pb.currentPage != 1}">
                        <a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${pb.currentPage - 1}&rows=20&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}"
                           aria-label="Previous">
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
                            <li class="active"><a
                                    href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${i}&rows=50&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}">${i}</a>
                            </li>
                        </c:if>

                        <c:if test="${pb.currentPage != i}">
                            <li>
                                <a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${i}&rows=50&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}">${i}</a>
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

                    <c:if test="${pb.currentPage ==pb.totalPage}">
                    <li class="disabled">
                        </c:if>

                        <c:if test="${pb.currentPage !=pb.totalPage}">
                    <li>
                        </c:if>
                        <c:if test="${pb.currentPage != pb.totalPage}">
                        <a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${pb.currentPage + 1}&rows=20&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}"
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
                        <input type="text" class="form-control" id="pageCode" name="pageCode" style="width:80px">
<%--                        <a class="btn btn-default" onclick="_go()" role="button" style="margin-left: 0;">Go!</a>--%>
                        <button type="submit" class="btn btn-default" onclick="_go()" style="margin-left: 0;">Go!</button>
                    </div><!-- /input-group -->
                </div>
            </div>

            <%--总页数--%>
            <div style="float: left;">
                <span style="font-size: 25px;margin-left: 20px; float: left">
                    共${pb.totalCount}条记录，共${pb.totalPage}页
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
        if(pc > ${pb.totalPage}) {//判断当前页码是否大于最大页
            swal("请输入正确的页码");
            return;
        }
        location = "${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage="+pc;
    }
    window.onload = function () {
        document.getElementById("firstCb").onclick = function () {

            var cbs = document.getElementsByName('mid');
            for (let i = 0; i < cbs.length; i++) {
                cbs[i].checked = this.checked;
            }

        };
    }
</script>
</body>
</html>