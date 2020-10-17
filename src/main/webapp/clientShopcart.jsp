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
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" data-toggle="modal" data-target="#myModal" >反馈</a></li>
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
                <table border="1" class="table table-bordered table-hover  table-condensed" id="tb1"
                       style="width: 100%;table-layout: fixed;">
                    <tr class="success">
                        <th style="width:3%"><input type="checkbox" id="checkAll" name="checkbox" class="checkedId">
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
                            <th class="wrap"><input type="checkbox" id="checkedBox" name="checkedId" class="checkedId"
                                                    value="${status.index+1}"
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
                                <a class="btn btn-primary" role="button" style="margin-left: 50px;"
                                   onclick="deleteShopCart(${shopcart.mno})">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
            <nav class="navbar navbar-default navbar-fixed-bottom">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse">
                        <div style="text-align: left;float: left;margin-top:8px;margin-left: 135px">
                            <a class="btn btn-danger delAll" href="javascript:void(0);" id="delSelected" role="button">删除选中</a>
                        </div>
                        <div style="text-align: right;float: right;margin-top:8px;margin-right: 135px;color: #D9534F;font-size: 25px">
                            <%--<button class="btn btn-danger buy" style="margin-right: 20px">购买</button>--%>
                            <a class="btn btn-danger buy" style="margin-right: 20px" role="button">购买</a>
                            共计<span id="total">0</span>元
                        </div>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
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

    function deleteShopCart(mno) {
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
                        data: {mno: mno},
                        type: "post",
                        success: function () {
                            swal({
                                    title: '删除成功',
                                    text: '成功删除了药品',
                                    type: 'success',
                                    confirmButtonText: '确定',
                                },
                                function () {
                                    location = 'findShopCartByPageServlet';
                                }
                            );
                        }
                    })
                } else {
                    swal("取消！", "您的药品未被删除)", "error");
                }
            });
    }


    window.onload = function () {
        document.getElementById("delSelected").onclick = function (mno) {
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
                        swal({
                                title: '删除成功',
                                text: '成功删除了药品',
                                type: 'success',
                                confirmButtonText: '确定',
                            },
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
                        swal("取消！", "你的药品未被删除)", "error");
                    }

                });
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