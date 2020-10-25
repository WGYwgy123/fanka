<%--
  Created by IntelliJ IDEA.
  User: gary
  Date: 2019/11/14
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>饭卡管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/fk.css">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <%--<style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            /*background-color: #eee;*/
            /*background:#fff url(img/Login.png) no-repeat left top;
            background-size:100%;*/
        }
    </style>--%>
</head>
<body background="img/Login.png"  style=" background-repeat:no-repeat ;  background-size:100% 100%; background-attachment: fixed;">
<div class="container">

    <form class="form-signin" action="/login" method="post">
        <div class="form-group row">
            <h2 class="form-signin-heading col-md-offset-4 col-sm-5">登录</h2><hr />
        </div>
        <div class="form-group row">
            <div class="col-md-3 col-md-offset-4"> <input type="text" id="inputEmail" class="form-control" placeholder="用户名" name="userId" required autofocus></div>
        </div>
        <div class="form-group row">
            <div class="col-sm-3 col-md-offset-4"> <input type="password" id="inputPassword" class="form-control" placeholder="密码" name="password" required></div>
        </div>
        <div class="form-group row ">
            <div class="col-md-offset-4 col-sm-3">
                <button class="btn btn-primary btn-block" type="submit">登录</button>
            </div>
        </div>
    </form>
    <div class="form-group row ">
        <div class="col-md-offset-4 col-sm-3">
            <button class="btn btn-default btn-block" onclick="window.location.href='/registerpage'">注册 </button>
        </div>
    </div>
</div>

<script src="js/bootstrap.min.js"></script>
</body>
</html>
<%--
<script>

    //取出传回来的参数error并与yes比较
    var errori ='<%=request.getParameter("error")%>';
    if(errori=='yes'){
        alert("登录失败!");
    }
</script>--%>
