<%--
  Created by IntelliJ IDEA.
  User: ZB
  Date: 2020/10/12
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    response.setHeader("refresh", "3;url=userSplist");
%>
<html>
<head>
    <%-- <base href="<%=basepath%>" /> --%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        #d1{
            height:40px;
            weight:800px;
            magin:auto;
            top:300px;
            background-color:green;
        }
        #tip,#s2{
            color:red;
            font-size:30px;
        }
        a{
            magin:auto;
        }
    </style>
    <script type="text/javascript">
        var i = 2 ;
        var Interval = setInterval(function() {
            document.getElementById("s2").innerHTML = i +"";
            i--;
            if (i==0) {
                clearInterval(Interval);
                //window.location="http://localhost:8080/ssm/main.jsp";
                //window.location="${url}";
            }
        },1000);

    </script>
</head>
<body>
<h1>注册成功！！</h1>


<div id="d1">
    <a href="${url }">立即跳转</a><br/>  //session.setAttribute("url", "login");
    <span id="s1">${tip }</span> //session.setAttribute("tip", "注册成功");
    <span id="s2">3</span>秒后自动跳转到登录页面
</div>


</body>
</html>
