<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 王宇杰
  Date: 2020/10/7
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员信息</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/myclient.css">
   <%-- <link rel="stylesheet" href="css/controladmin.css">--%>

    <script>
        window.onload = function(){
            document.getElementById("topcheckbox").onclick = function () {

                var cbs = document.getElementsByName('aid');
                for (let i = 0; i < cbs.length; i++) {
                    cbs[i].checked = this.checked;
                }

            };
        }

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


        function adminAddreg() {
            var aname = $(".aname").val();
            var apassword = $(".apassword").val();
            var reg = /^\s*$/
            var flag1 = aname != null && aname != undefined && !reg.test(aname);
            var flag2 = apassword != null && apassword != undefined && !reg.test(apassword);
                if (flag1 && flag2){
                $.ajax({
                    url: "./addAdminServlet",
                    type: "post",
                    data: $('#adminAddForm').serialize(),
                    success:function (data) {
                        if (data == "success"){
                            swal({
                                title:"添加成功！"
                            },function () {
                                window.location.reload();
                            })
                        }else if (data == "error"){
                            swal({
                                title:"添加失败",
                                text:"管理员账号重复"
                            },function () {
                                window.location.reload();
                            })
                        }
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
    </script>
</head>
<body style="padding-top:50px">
    <div class="nav1">
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

                    <ul class="nav navbar-nav navbar-right">
                        <li role="presentation"><a href="#" data-toggle="modal" data-target="#myModal">添加</a></li>
                        <li role="presentation"><a href="javascript:deleteChoose()">删除选中</a></li>
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

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">添加管理员</h4>
                    </div>
                    <div class="modal-body">
                        <form  method="post" id="adminAddForm">
                            <div class="input-group">
                                <input type="text" class="form-control aname" placeholder="请输入管理员账号" autocomplete="off" name="aname" style="width:500px" aria-describedby="basic-addon1">
                                <input type="password" class="form-control apassword" placeholder="请输入管理员密码" autocomplete="off" name="apassword" style="width:500px;margin-top: 30px" aria-describedby="basic-addon1">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" style="color: black">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="adminAddreg()" data-dismiss="modal">提交</button>
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
                        <h4 class="modal-title" id="myModalLabel2">修改管理员密码</h4>
                    </div>
                    <div class="modal-body">
                        <form  method="post" id="adminModifyForm">
                        <div class="form-group">
                            <label for="aname">账号</label>
                            <input type="text" class="form-control aname" id="aname" autocomplete="off" name="aname" readonly="readonly" style="width:500px" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="apassword">密码</label>
                            <input type="password" class="form-control apassword" id="apassword" placeholder="请输入管理员密码" autocomplete="off" name="apassword" style="width:500px;margin-top: 30px" aria-describedby="basic-addon1">
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" style="color: black">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="adminMdifyPassword()" data-dismiss="modal">提交</button>
                    </div>
                </div>
            </div>
        </div>




    </div>

    <div class="nav2">
        <div id="controlAdmintop">
            <img src="images/title.png">
        </div>
    </div>

    <div class="nav3">
        <div class="container1"></div>
        <div class="container2">

        <div id="controlAdminBg">
            <div id="controlAdminMain">
                <div id="controlAdminTab">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <td style="width: 10%"><input type="checkbox" id="topcheckbox" class="admincheck"></td>
                        <td style="width: 20%">编号</td>
                        <td style="width: 20%">账号</td>
                        <td style="width: 20%">密码</td>
                        <td style="width: 30%">操作</td>
                        </thead>
                        <tbody id="adminbody">
                        <c:forEach items="${adminInfos}" var="adminInfo">
                            <tr>
                                <td><input type="checkbox" name="aid" value="${adminInfo.aid}" class="admincheck"></td>
                                <td>${adminInfo.aid}</td>
                                <td>${adminInfo.aname}</td>
                                <td>${adminInfo.apassword}</td>
                                <td style="text-align: center"><a class="btn btn-large btn-primary" href="javascript:;" onclick="sendaname('${adminInfo.aname}')" role="button" style="margin-right: 30px"  data-toggle="modal" data-target="#myModal2">改密</a>
                                    <a href="javascript:void(0)" onclick="del(${adminInfo.aid})" class="btn btn-large btn-primary">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        </div>
        <div class="container3"></div>
    </div>

</body>
<%
    String mess = (String) session.getAttribute("message");
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
    session.setAttribute("message", "");
%>

<%
    String updatemess = (String) session.getAttribute("updateAdminMessage");
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
    session.setAttribute("updateAdminMessage", "");
%>

<%
    String deleteemess = (String) session.getAttribute("deleteAdminMessage");
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
    session.setAttribute("deleteAdminMessage", "");
%>


<script>

    function sendaname(aname) {
       $("#aname").val(aname);
    }

    function adminMdifyPassword() {
        var aname = $("#aname").val();
        var apassword = $("#apassword").val();
        var reg = /^\s*$/
        var flag1 = aname != null && aname != undefined && !reg.test(aname);
        var flag2 = apassword != null && apassword != undefined && !reg.test(apassword);
        if (flag1 && flag2){
            $.ajax({
                url: "./adminUpdateAdminServlet",
                type: "post",
                data: $('#adminModifyForm').serialize(),
                success:function (data) {
                    if (data == "success"){
                        swal({
                            title:"修改成功！"
                        },function () {
                            window.location.reload();
                        })
                    }else if (data == "error"){
                        swal({
                            title:"修改失败",
                            text:"服务器异常"
                        },function () {
                            window.location.reload();
                        })
                    }
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

    function del(aid){
        swal({
            title: "确定删除吗？",
            text: "你将无法恢复这个管理员！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定删除！",
            cancelButtonText: "取消删除！",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function (isConfirm) {
            if (isConfirm) {
                location="${pageContext.request.contextPath}/deleteAdminServlet?aid="+aid;
            } else {
                swal("取消！", "该管理员现在安全了:)", "error");
            }
        });
    }
    function deleteChoose() {
        var checked = $("input[class='admincheck']:checked");
        if (checked.length==0){
            swal("请至少选择一个")
        }else {
            swal({
                title: "确定删除吗？",
                text: "你将无法恢复这些管理员！",
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
                    swal("取消！", "这些管理员现在安全了:)", "error");
                }
            });
        }

    }
    function deletechoose() {
        var checkeds=$("#adminbody :checked");
        var adminlist=[];
        $.each(checkeds,function (i,n) {
            n=$(n)
            var child=n.parents("tr").children();
            var ano=child.eq(1).text();
            adminlist.push(ano);
        })
        location="adminDeleteChooseAdminServlet?anos="+adminlist;
    }
   /* $(function () {
        $(".btn").click(function () {
            swal({
                title: "确定删除吗？",
                text: "你将无法恢复该虚拟文件！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定删除！",
                cancelButtonText: "取消删除！",
                closeOnConfirm: false,
                closeOnCancel: false
            }, function (isConfirm) {
                if (isConfirm) {
                    swal("删除！", "你的虚拟文件已经被删除。", "success");
                    location="${pageContext.request.contextPath}/deleteAdminServlet";
                } else {
                    swal("取消！", "你的虚拟文件是安全的:)", "error");
                }
            });
        })
    })*/
</script>
</html>
