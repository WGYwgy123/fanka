<%--
  Created by IntelliJ IDEA.
  User: gary
  Date: 2019/11/15
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/fk.css">
</head>
<body background="img/dust_scratches.png">
<nav class="navbar navbar-default navbar-fixed-top" >
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/index">首页</a>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <!--<li><a href="#">Link</a></li>-->
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.userId}<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#" data-toggle="modal" data-target="#modify">修改密码</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="/logout">注销</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<div class="container" style="margin-top: 1em">
    <div class="row">
        <form action="/select">
            <div class="form-group">
                <div class="col-md-offset-6 col-md-4"><input class="form-control" type="text" placeholder="用户名" name="userId"></div>
                <div class="col-md-2"><button type="submit" class="btn btn-default">搜索</button></div>
            </div>
        </form>
    </div>
    <div class="row"style="margin-top: 3em">
        <div class="panel panel-default" >
            <!-- Default panel contents -->
            <div class="panel-heading"><div class="col-md-3"><h5>用户查询</h5></div><div class="text-right"><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#add">模拟消费</button></div></div>

            <!-- Table -->
            <table class="table table-hover">
                <tr>
                    <th>用户名</th>
                    <th>状态</th>
                    <th>余额</th>
                    <th>操作</th>
                </tr>

                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.userId}</td>
                        <c:if test="${user.power eq -1}">
                            <td>挂失</td>
                            <td>${user.balance}</td>
                            <td><button class="btn btn-primary btn-sm" onclick="window.location.href='/admrep?Id=${user.userId}'">解除挂失</button>
                                <button class="btn btn-danger btn-sm" onclick="window.location.href='/admdel?Id=${user.userId}'">删除用户</button></td>
                        </c:if>
                        <c:if test="${user.power eq 0}">
                            <td>正常</td>
                            <td>${user.balance}</td>
<%--                            <td><button class="btn btn-danger btn-sm" onclick="window.location.href='/admdel?Id=${user.userId}'">删除用户</button>--%>
                            <td><button class="btn btn-danger btn-sm" onclick="return confirmOper(${user.userId});">删除用户</button>
                                <button class="btn btn-primary btn-sm" onclick="window.location.href='/admsup?Id=${user.userId}'">挂失</button>
                                <button class="btn btn-primary btn-sm" onclick="etest1(${user.userId})" >详细情况</button></td>
                        </c:if>
                        <c:if test="${user.power eq 1}">
                            <td>管理</td>
                            <td>${user.balance}</td>
                            <td>不可操作</td>
                        </c:if>


                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
</div>

<div  class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改密码</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal center-block" action="/modify" method="post" ID="modifyform">

                    <div class="row form-group">
                        <div class="col-md-2 text-right col-md-offset-2">
                            <label class="control-label">原密码</label>
                        </div>
                        <div class="col-md-4">
                            <input class="input form-control" type="password" name="oldpsd" required>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-2 text-right col-md-offset-2">
                            <label class="control-label">新密码</label>
                        </div>
                        <div class="col-md-4">
                            <input class="input form-control" type="password" name="newpsd" required>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-2 text-right col-md-offset-2">
                            <label class="control-label">确认密码</label>
                        </div>
                        <div class="col-md-4">
                            <input class="input form-control" type="password" name="copsd" required>
                        </div>
                    </div>
                </form>

            </div>



            <div class="modal-footer">

                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary" form="modifyform">确认</button>

            </div>
        </div>
    </div>
</div>
<div tabindex="-1" class="modal fade" id="look" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
    &lt;
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" aria-label="Close" type="button" data-dismiss="modal"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title">详细情况</h4>
            </div>

            <form class="form-horizontal center-block" id="lookform"
                  action="${pageContext.request.contextPath }/admrec"
                  method="post">
                <div class="modal-body">
                    <table id="tb" border="1" class="table table-hover">
                        <tr>
                            <th>用户</th>
                            <th>时间</th>
                            <th>消费事项</th>
                            <th>金额</th>
                        </tr>
                    </table>

                </div>
            </form>



            <div class="modal-footer">

                <button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>

            </div>
        </div>
    </div>
</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    function etest1(id) {
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/admrec",
            data:{"userId":id},
            success: showQuery,
        });
    }
    function showQuery(data){
        console.log(data);
        $('#tb tr:gt(0)').remove();
        $('#look').modal('show');
        var s = '';
        for (var i = 0; i < data.length; i++) s += '<tr><td>' + data[i].userId + '</td><td>' + data[i].date + '</td><td>' + data[i].message + '</td>'
            + '<td>' + data[i].pay + '</td></tr>';
        $('#tb').append(s);
    }
    function confirmOper(id){
        window.confirm("确认删除用户吗？");
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/admdel",
            data:{"Id":id},
        });
        alert('删除用户成功！');
        window.location.href='/selectpage';
    }
</script>
</html>
