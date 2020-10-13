<%@ page import="com.czu.domain.Orders" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/myclient.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <script src="js/sweetalert-dev.js"></script>
    <script src="js/shopcart.js"></script>
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
        <form id="form" action="${pageContext.request.contextPath}/addOrderServlet" method="post">
            <div class="table-responsive">
                <table border="1" class="table table-bordered table-hover  table-condensed" id="tb1" style="width: 100%;
            table-layout: fixed;">
                    <tr class="success">
                        <th style="width:3%"><input type="checkbox" id="checkAll" name="checkbox">
                        <th style="width:7%">序号</th>
                        <th style="width:10%">药品编号</th>
                        <th style="width:10%">药品名</th>
                        <th style="width:35%">药品功效</th>
                        <th style="width:10%">药品单价</th>
                        <th style="width:5%">药品数量</th>
                        <th style="width:10%">药品总价</th>
                        <th style="width:10%">操作</th>
                    </tr>

                    <c:forEach items="${shopcart}" var="shopcart" varStatus="status">
                        <tr>
                            <th class="wrap"><input type="checkbox" name="checkedId" class="checkedId"
                                                    value="${status.index+1}" mno="${shopcart.mno}"
                                                    mname="${shopcart.mname}" mefficacy="${shopcart.mefficacy}"
                                                    mprice="${shopcart.mprice}" num="${shopcart.num}"
                                                    totalprice="${shopcart.mprice * shopcart.num}"></th>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${status.index+1}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${shopcart.mno}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${shopcart.mname}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${shopcart.mefficacy}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${shopcart.mprice}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${shopcart.num}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${shopcart.mprice * shopcart.num}</td>
                            <td>
                                <a class="btn btn-primary" role="button" style="margin-left: 50px;" onclick="deleteShopCart(${shopcart.mno})">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <%--<div class="panel-footer" style="text-align: right;">
                <a class="btn btn-primary" href="javascript:buyMedicine();"  role="button" style="margin-left: 50px;">购买</a>
                共计<span id="total" >0</span>元
                </div>--%>
            </div>

            <nav class="navbar navbar-default navbar-fixed-bottom">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse">
                        <div style="text-align: left;float: left;margin-top:8px;margin-left: 135px">
                            <a class="btn btn-danger" href="javascript:void(0);" id="delSelected" role="button">删除选中</a>
                        </div>
                        <div style="text-align: right;float: right;margin-top:8px;margin-right: 135px;color: #D9534F;font-size: 25px">
                            <button class="btn btn-danger" style="margin-right: 20px">购买</button>
                            共计<span id="total">0</span>元
                        </div>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </form>


        <%-- &lt;%&ndash;分页&ndash;%&gt;
         <div style="float: left">
             <nav aria-label="Page navigation">
                 <ul class="pagination">
                     <c:if test="${pb2.currentPage == 1}">
                     <li class="disabled">
                      </c:if>

                         <c:if test="${pb2.currentPage != 1}">
                     <li>
                         </c:if>
                         <c:if test="${pb2.currentPage != 1}">
                         <a href="${pageContext.request.contextPath}/findShopCartByPageServlet?currentPage=${pb2.currentPage - 1}&rows=10" aria-label="Previous">
                             </c:if>

                             <span aria-hidden="true">&laquo;</span>
                         </a>
                     </li>

                     &lt;%&ndash;中间页&ndash;%&gt;
                     &lt;%&ndash;显示6页中间页[begin=起始页,end=最大页]&ndash;%&gt;
                     &lt;%&ndash;总页数没有6页&ndash;%&gt;
                     <c:choose>
                         <c:when test="${pb2.totalPage <= 6}">
                             <c:set var="begin" value="1"/>
                             <c:set var="end" value="${pb2.totalPage}"/>
                         </c:when>
                         &lt;%&ndash;页数超过了6页&ndash;%&gt;
                         <c:otherwise>
                             <c:set var="begin" value="${pb2.currentPage - 1}"/>
                             <c:set var="end" value="${pb2.currentPage + 3}"/>
                             &lt;%&ndash;如果begin减1后为0,设置起始页为1,最大页为6&ndash;%&gt;
                             <c:if test="${begin -1 <= 0}">
                                 <c:set var="begin" value="1"/>
                                 <c:set var="end" value="6"/>
                             </c:if>
                             &lt;%&ndash;如果end超过最大页,设置起始页=最大页-5&ndash;%&gt;
                             <c:if test="${end > pb2.totalPage}">
                                 <c:set var="begin" value="${pb2.totalPage - 5}"/>
                                 <c:set var="end" value="${pb2.totalPage}"/>
                             </c:if>
                         </c:otherwise>
                     </c:choose>

                     &lt;%&ndash;遍历&ndash;%&gt;
                     <c:forEach var="i" begin="${begin}" end="${end}">
                         &lt;%&ndash;当前页,选中&ndash;%&gt;
                         <c:if test="${pb2.currentPage == i}">
                             <li class="active">
                                 <a href="${pageContext.request.contextPath}/findShopCartByPageServlet?currentPage=${i}&rows=10">${i}</a>
                             </li>
                         </c:if>

                         <c:if test="${pb2.currentPage != i}">
                             <li>
                                 <a href="${pageContext.request.contextPath}/findShopCartByPageServlet?currentPage=${i}&rows=10">${i}</a>
                             </li>
                         </c:if>
                     </c:forEach>

                     &lt;%&ndash;<c:forEach begin="1" end="${pb.totalPage}" var="i">

                         <c:if test="${pb.currentPage == i}">
                             <li class="active"><a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${i}&rows=50&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}">${i}</a></li>
                         </c:if>

                         <c:if test="${pb.currentPage != i}">
                             <li><a href="${pageContext.request.contextPath}/findMedicineByPageServlet?currentPage=${i}&rows=50&mno=${condition.mno[0]}&mname=${condition.mname[0]}&mefficacy=${condition.mefficacy[0]}">${i}</a></li>
                         </c:if>
                     </c:forEach>&ndash;%&gt;

                     <c:if test="${pb2.currentPage ==pb2.totalPage}">
                     <li class="disabled">
                         </c:if>

                         <c:if test="${pb2.currentPage !=pb2.totalPage}">
                     <li>
                         </c:if>
                         <c:if test="${pb2.currentPage != pb2.totalPage}">
                         <a href="${pageContext.request.contextPath}/findShopCartByPageServlet?currentPage=${pb2.currentPage + 1}&rows=10"
                            aria-label="Next">
                             </c:if>
                             <span aria-hidden="true">&raquo;</span>
                         </a>
                     </li>
                 </ul>
             </nav>
         </div>

         &lt;%&ndash;跳转指定页数&ndash;%&gt;
         <div style="float: right;margin-top: 22px;">
             <div class="jump" style="float: left">
                 <div class="page-jump">
                     <div class="input-group">
                         <input type="text" class="form-control" id="pageCode" name="pageCode" value="${pb2.currentPage}" style="width:100px">
                         <span class="input-group-btn">
                         <button class="btn btn-default" type="submit" onclick="_go()" style="background: black">Go!</button>
                         </span>
                     </div><!-- /input-group -->
                 </div><!-- /.col-lg-6 -->

             </div>

             &lt;%&ndash;总页数&ndash;%&gt;
             <div style="float: left;">
                 <span style="font-size: 25px;margin-left: 20px; float: left">
                     共${pb2.totalCount}条记录，共${pb2.totalPage}页
                 </span>
             </div>
         </div>--%>
    </div>
    <div class="container3"></div>
</div>
<script>

    function deleteShopCart(mno) {
        swal({
                title: "确定删除吗？",
                text: "再见",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定删除！",
                cancelButtonText: "取消删除！",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function (isConfirm) {
                if (isConfirm) {
                    swal({title:'删除成功',
                         text:'成功删除了药品',
                         type:'success',
                         confirmButtonText:'确定',},
                        function (isConfirm) {
                            if (isConfirm){
                                location ='addOrderServlet?mno='+mno;
                            }
                        }
                    );
                } else {
                    swal("取消！", "你的药品未被删除)","error");
                }
            });

            /*if (confirm("确定删除吗？")){
                location.href = "${pageContext.request.contextPath}/addOrderServlet?mno="+mno;
    }*/



    window.onload = function () {
        document.getElementById("delSelected").onclick = function () {
            swal({
                    title: "确定删除吗？",
                    text: "再见",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定删除！",
                    cancelButtonText: "取消删除！",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if (isConfirm) {
                        swal({title:'删除成功',
                                text:'成功删除了药品',
                                type:'success',
                                confirmButtonText:'确定',},
                            function (isConfirm) {
                                if (isConfirm) {
                                    var flag = false;
                                    //判断是否有选中条目
                                    var cbs = document.getElementsByName('checkedId');
                                    for (let i = 0; i < cbs.length; i++) {
                                        if (cbs[i].checked) {
                                            //有一个条目选中了
                                            flag = true;
                                            break;
                                        }
                                    }
                                    if (flag) {//有条目被选中
                                        //提交表单
                                        document.getElementById("form").submit();
                                    }
                                }
                            }
                        );
                    } else {
                        swal("取消！", "你的药品未被删除)","error");
                    }

                });
        }

    }
    }
    /*window.onload = function () {
        document.getElementById("checkAll").onclick = function () {

            var cbs = document.getElementsByName('checkedId');
            for (let i = 0; i < cbs.length; i++) {
                cbs[i].checked = this.checked;
            }
        };
    }*/

</script>
</body>
</html>