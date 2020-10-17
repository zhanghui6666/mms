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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>药品管理</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/myclient.css">
    <script>
        $(function () {
            $("#adminFunChoose").find("li").each(function () {
                var a = $(this).find("a:first")[0];
                if ($(a).attr("href") === location.pathname) {
                    $(this).addClass("active");
                } else {
                    $(this).removeClass("active");
                }
            });
        })
    </script>
</head>
<body>
<div class="nav1" style="padding-top:50px">
    <nav class="navbar navbar-default navbar-fixed-top">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav nav-tabs" id="adminFunChoose">
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/findAllAdminServlet">管理员信息管理</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/findAllUserServlet">用户信息管理</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/adminControlMedicineServlet">仓库管理</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/adminFeedbackServlet">用户反馈</a></li>
                <form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/adminControlMedicineServlet" style="margin-left: 100px">
                    <div class="form-group">
                        <input style="width: 200px" type="text" name="mno" class="form-control" id="medicineno" value="${condition.mno[0]}" placeholder="药品编号">
                        <input style="width: 200px;margin-left: 20px" type="text" name="mname" class="form-control" value="${condition.mname[0]}" id="medicineName" placeholder="药品名">
                        <input style="width: 200px;margin-left: 20px" type="text" name="mefficacy" class="form-control" value="${condition.mefficacy[0]}" id="medicineFunction" placeholder="药品功效">
                    </div>
                    <button type="submit" style="margin-left: 20px;color: black" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="javascript:deleteChoose()">删除选中</a></li>
                    <li><a href="${pageContext.request.contextPath}/adminAddMedicine.jsp">添加</a></li>
                    <li class="dropdown" style="margin-right: 30px;margin-top:3px">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:logout()">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
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


<div class="nav3">
    <div class="container1"></div>
    <%--获取数据--%>
    <div class="container2">
        <form id="form" method="post">
            <div class="table-responsive">
                <table border="1" class="table table-bordered table-hover table-condensed" id="tb1" style="width: 99%;table-layout: fixed;">
                    <tr class="success">
                        <th style="width:3%"><input type="checkbox" id="firstCb" class="medicinecheck"></th>
                        <th style="width:10%">编号</th>
                        <th style="width:10%">药名</th>
                        <th style="width:5%">特性</th>
                        <th style="width:40%">作用</th>
                        <th style="width:5%">单价</th>
                        <th style="width:5%">数量</th>
                        <th style="width:5%">序号</th>
                        <th style="width:15%">操作</th>
                    </tr>

                    <tbody id="medicinebody">
                    <c:forEach items="${medicinePageBean.list}" var="medicine">
                        <tr>
                            <th><input type="checkbox" name="mid" value="${medicine.mid}" class="medicinecheck"></th>
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
                            <td style="text-align: center"><a class="btn btn-primary" style="margin-right: 20px"  href="${pageContext.request.contextPath}/adminFindOneMedicineServlet?mno=${medicine.mno}">编辑</a>
                                <a class="btn btn-primary"  href="javascript:void(0)" onclick="del(${medicine.mno})">删除</a>&nbsp;
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </form>

        <%--分页--%>
        <div style="float: left">
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
                        <li>
                            <span>...</span>
                        </li>

                        <li>
                            <input type="text" class="form-control" id="pageCode" name="pageCode" value="${medicinePageBean.currentPage}" style="width:60px;float: left">
                            <a href="javascript:_go()">Go</a>
                        </li>
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
                </ul>
            </nav>
        </div>

        <%--跳转指定页数--%>
        <div style="float: right;margin-top: 22px;">
            <%--总页数--%>
            <div style="float: left;">
                <span style="font-size:25px;margin-left:10px;margin-right:10px; float: left">
                    共${medicinePageBean.totalCount}条记录，共${medicinePageBean.totalPage}页
                </span>
            </div>
        </div>
    </div>
    <div class="container3"></div>
</div>
<script>

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
                location = "${pageContext.request.contextPath}/adminLogoutServlet";
            });
    }




    function _go() {
        var pc = $("#pageCode").val();//获取文本框中的当前页码
        if(!/^[1-9]\d*$/.test(pc)) {//对当前页码进行整数校验
            swal("请输入正确的页码");
            return;
        }
        if(pc > ${medicinePageBean.totalPage}) {//判断当前页码是否大于最大页
            swal("页码太大啦!");
            return;
        }
        location = "${pageContext.request.contextPath}/adminControlMedicineServlet?currentPage="+pc;
    }

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
        var checked = $("input[class='medicinecheck']:checked");
        if (checked.length==0){
            swal("请至少选择一种药品")
        }else {
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
</body>
</html>


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
