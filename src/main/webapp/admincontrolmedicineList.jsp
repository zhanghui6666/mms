<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 王宇杰
  Date: 2020/10/13
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>药品管理</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/controlmedicine.css">
</head>
<body>
<div class="nav1">
    <div class="logo_container">
        <form class="form-inline" style="float:right;margin-top: 30px" action="${pageContext.request.contextPath}/adminControlMedicineServlet" method="post">
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
                <tbody id="medicinebody">
                <c:forEach items="${medicinePageBean.list}" var="medicine">
                    <tr>
                        <th><input type="checkbox" name="mid" value="${medicine.mid}"></th>
                        <td>${medicine.mno}</td>
                        <td>${medicine.mname}</td>
                        <td>${medicine.mmode}</td>
                        <td>${medicine.mefficacy}</td>
                        <td style="white-space: nowrap">${medicine.mprice}</td>
                        <td style="white-space: nowrap">${medicine.mnumber}</td>
                        <td style="white-space: nowrap">${medicine.mid}</td>
                        <td style="width: 200px;text-align: center"><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/adminFindOneMedicineServlet?mno=${medicine.mno}">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-default btn-sm" href="javascript:void(0)" onclick="del(${medicine.mno})">删除</a>&nbsp;
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
        <div style="width: 100%;overflow: auto;">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${medicinePageBean.currentPage == 1}">
                    <li class="disabled">
                        </c:if>

                        <c:if test="${medicinePageBean.currentPage != 1}">
                    <li>
                        </c:if>

                        <c:if test="${medicinePageBean.currentPage != 1}">
                        <a href="${pageContext.request.contextPath}/adminControlMedicineServlet?currentPage=${medicinePageBean.currentPage - 1}&rows=10&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}" aria-label="Previous">
                            </c:if>

                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>



                    <%--中间页--%>
                    <%--显示6页中间页[begin=起始页,end=最大页]--%>
                    <%--总页数没有6页--%>
                    <c:choose>
                        <c:when test="${medicinePageBean.totalPage <= 6}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${medicinePageBean.totalPage}"/>
                        </c:when>
                        <%--页数超过了6页--%>
                        <c:otherwise>
                            <c:set var="begin" value="${medicinePageBean.currentPage - 1}"/>
                            <c:set var="end" value="${medicinePageBean.currentPage + 3}"/>
                            <%--如果begin减1后为0,设置起始页为1,最大页为6--%>
                            <c:if test="${begin -1 <= 0}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="6"/>
                            </c:if>
                            <%--如果end超过最大页,设置起始页=最大页-5--%>
                            <c:if test="${end > medicinePageBean.totalPage}">
                                <c:set var="begin" value="${medicinePageBean.totalPage - 5}"/>
                                <c:set var="end" value="${medicinePageBean.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    <%--遍历--%>
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <%--当前页,选中--%>
                        <c:if test="${medicinePageBean.currentPage == i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/adminControlMedicineServlet?currentPage=${i}&rows=10&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}">${i}</a></li>
                        </c:if>

                        <c:if test="${medicinePageBean.currentPage != i}">
                            <li><a href="${pageContext.request.contextPath}/adminControlMedicineServlet?currentPage=${i}&rows=10&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}">${i}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${medicinePageBean.currentPage ==medicinePageBean.totalPage}">
                    <li class="disabled">
                        </c:if>

                        <c:if test="${medicinePageBean.currentPage !=medicinePageBean.totalPage}">
                    <li>
                        </c:if>
                        <c:if test="${medicinePageBean.currentPage != medicinePageBean.totalPage}">
                        <a href="${pageContext.request.contextPath}/adminControlMedicineServlet?currentPage=${medicinePageBean.currentPage + 1}&rows=10&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}" aria-label="Next">
                            </c:if>
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <span style="font-size: 25px;margin-left: 5px;" >
                    共${medicinePageBean.totalCount}条记录，共${medicinePageBean.totalPage}页
                </span>
                </ul>
            </nav>
            <a href="javascript:void(0)" onclick="deleteChoose()">
                <button type="button" class="btn btn-default btn-button" style="width: 200px">删除选中</button>
            </a>
            <a href="${pageContext.request.contextPath}/adminAddMedicine.jsp">
                <button type="button" class="btn btn-default btn-button">添加</button>
            </a>
            <a href="${pageContext.request.contextPath}/adminchoose.jsp">
                <button type="button" class="btn btn-default btn-button">返回</button>
            </a>
        </div>
    </div>


</div>
</body>
<%
    String mess = (String) session.getAttribute("addMedicineMessage");
    if ("".equals(mess) || mess == null) {
    } else {
%>
<script>
    $(function () {
        swal("<%=mess%>");
    })
</script>
<%
    }
    session.setAttribute("addMedicineMessage", "");
%>

<%
    String updatemess = (String) session.getAttribute("updateMedicineMessage");
    if ("".equals(updatemess) || updatemess == null) {
    } else {
%>
<script>
    $(function () {
        swal("<%=updatemess%>");
    })
</script>
<%
    }
    session.setAttribute("updateMedicineMessage", "");
%>

<%
    String deleteemess = (String) session.getAttribute("deleteMedicineMessage");
    if ("".equals(deleteemess) || deleteemess == null) {
    } else {
%>
<script>
    $(function () {
        swal("<%=deleteemess%>");
    })
</script>
<%
    }
    session.setAttribute("deleteMedicineMessage", "");
%>

<script>
    window.onload = function(){
        document.getElementById("firstCb").onclick = function () {

            var cbs = document.getElementsByName('mid');
            for (let i = 0; i < cbs.length; i++) {
                cbs[i].checked = this.checked;
            }

        };
    }
    function del(mno){
        swal({
            title: "确定删除吗？",
            text: "你将无法恢复这个药！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定删除！",
            cancelButtonText: "取消删除！",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function (isConfirm) {
            if (isConfirm) {

                location="${pageContext.request.contextPath}/adminDeleteMedicineServlet?mno="+mno;
            } else {
                swal("取消！", "这个药现在安全了:)", "error");
            }
        });
    }
    function deleteChoose() {
        swal({
            title: "确定删除吗？",
            text: "你将无法恢复这些药品！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定删除！",
            cancelButtonText: "取消删除！",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function (isConfirm) {
            if (isConfirm) {
                deletechoose()
            } else {
                swal("取消！", "这些药品现在安全了:)", "error");
            }
        });
    }
    function deletechoose() {
        var checkeds=$("#medicinebody :checked");
        var medicinelist=[];
        $.each(checkeds,function (i,n) {
            n=$(n)
            var child=n.parents("tr").children();
            var mno=child.eq(1).text();
            medicinelist.push(mno);
        })
        location="adminDeleteChooseMedicineServlet?mnos="+medicinelist;
    }
</script>
</html>
