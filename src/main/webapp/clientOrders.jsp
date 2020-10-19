<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单</title>
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
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" data-toggle="modal" data-target="#myModal" >反馈</a></li>
                            <li><a href="${pageContext.request.contextPath}/findAllOrdersServlet" id="findAllOrders">我的订单</a></li>
                            <li><a href="javascript:logout()">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right barshopcart">
                    <li><a href="${pageContext.request.contextPath}/findShopCartByPageServlet">购物车</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
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
                            <input type="text" autocomplete="off" class="form-control ctext" placeholder="反馈信息" name="ctext" style="width:500px" aria-describedby="basic-addon1">
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

<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">订单</h4>
            </div>
            <div class="modal-body">
                <table border="1" class="table table-bordered table-hover  table-condensed" id="tb1"
                       style="width: 100%;table-layout: fixed;">
                    <tr class="success">
                        <th style="width:5%"><input type="checkbox" id="checkAllOrders" name="checkbox" class="checkedId">
                        <th style="width:20%">药品名</th>
                        <th style="width:10%">单价</th>
                        <th style="width:10%">数量</th>
                        <th style="width:10%">总价</th>
                        <th style="width:28%">购买日期</th>
                        <th style="width:17%">操作</th>
                    </tr>

                    <c:forEach items="${orders}" var="orders" varStatus="status">
                        <tr>
                            <th class="wrap"><input type="checkbox" id="checkedBox1" name="ordercheckedId" class="ordercheckedId"
                                                    value="${status.index+1}"></th>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${orders.mname}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${orders.mprice}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${orders.num}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${orders.totalprice}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${orders.date}</td>
                            <td style="text-align: center">
                                <a class="btn btn-primary" role="button"
                                   onclick="deleteOrders(${orders.oid})">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" style="color: black">关闭</button>
            </div>
        </div>
    </div>
</div>


</div>
<div class="nav2">
    <div class="logo_container">
        <img src="images/title.png">
    </div>
</div>


<div class="nav3">

    <div class="container1"></div>

    <%--获取数据--%>
    <div class="container2">
        <form id="form" method="post">
            <div class="table-responsive">
                <table border="1" class="table table-bordered table-hover  table-condensed" id="tb2"
                       style="width: 100%;table-layout: fixed;">
                    <tr class="success">
                        <th style="width:20%">药品名</th>
                        <th style="width:10%">单价</th>
                        <th style="width:10%">数量</th>
                        <th style="width:10%">总价</th>
                        <th style="width:28%">购买日期</th>
                        <th style="width:17%">操作</th>
                    </tr>

                    <c:forEach items="${orders}" var="orders" varStatus="status">
                        <tr>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${orders.mname}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${orders.mprice}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${orders.num}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${orders.totalprice}</td>
                            <td class="wrap" onmouseover="this.className = 'wrap1'"
                                onmouseout="this.className = 'wrap'">${orders.date}</td>
                            <td style="text-align: center">
                                <a class="btn btn-primary" role="button"
                                   onclick="deleteOrders(${orders.oid})">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
        </form>

    </div>
    <div class="container3"></div>
</div>
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

    function buydel(mno) {
        location = 'deleteOrderServlet?mno=' + mno;
    }

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

    function deleteOrders(oid) {
        swal({
                title: "确定删除吗？",
                text: "删除这个药品",
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
                    $.ajax({
                        url: "./deleteOrderServlet",
                        data: {oid: oid},
                        type: "post",
                        success: function () {
                            swal({
                                    title: '删除成功',
                                    text: '成功删除了药品',
                                    type: 'success',
                                    confirmButtonText: '确定',
                                },
                                function () {
                                    location = 'findAllOrdersServlet';
                                }
                            );
                        }
                    })
                } else {
                    swal("取消！", "您的药品未被删除)", "error");
                }
            });
    }


</script>
</body>
</html>