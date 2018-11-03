<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 18-10-30
  Time: 下午8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>海客邮箱</title>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
    <h3>欢迎进入海客邮箱</h3>
</div>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">收件管理<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">收件箱</a></li>
                <li><a href="#">草稿箱</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">发件管理<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">发件箱</a></li>
                <li><a href="#">写信</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">通讯录<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">联系人</a></li>
            </ul>
        </li>
        <li>
            <a href="#">修改密码</a>
        </li>
    </div>
</nav>
</body>
</html>
