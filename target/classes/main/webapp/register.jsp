<%--
  Created by IntelliJ IDEA.
  User: gary
  Date: 2019/11/19
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>饭卡管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/fk.css">
    <%--<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">--%>
    <%--<style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
        }
    </style>--%>
</head>
<body background="img/Login.png"  style=" background-repeat:no-repeat ;  background-size:100% 100%; background-attachment: fixed;">
<div class="container">

    <form class="form-signin" action="/register" method="post">
        <div class="form-group row">
            <h2 class="form-signin-heading col-md-offset-4 col-sm-5">注册</h2><hr />
        </div>
        <div class="form-group row">
            <div class="col-md-3 col-md-offset-4"> <input type="text" class="form-control" placeholder="用户名" name="userId" required autofocus></div>
        </div>
        <div class="form-group row">
            <div class="col-sm-3 col-md-offset-4"> <input type="password" class="form-control" placeholder="密码" name="password1" required></div>
        </div>
        <div class="form-group row">
            <div class="col-sm-3 col-md-offset-4"> <input type="password" class="form-control" placeholder="重复密码" name="password2"  required></div>
        </div>
        <div class="form-group row ">
            <div class="col-md-offset-4 col-sm-3">
                <button class="btn btn-primary btn-block" type="submit">确认</button>
            </div>
        </div>
    </form>
    <div class="form-group row ">
        <div class="col-md-offset-4 col-sm-3">
            <button class="btn btn-default btn-block" onclick="window.location.href='/loginpage'">返回</button>
        </div>
    </div>
</div>

<script src="js/bootstrap.min.js"></script>
</body>
</html>
