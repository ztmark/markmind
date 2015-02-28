<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />

</head>
<body>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home/${blogInfo.username}">
                <span class="site-name">${blogInfo.blogName}</span>
                <small class="site-motto">${blogInfo.motto}</small>
            </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">About</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <table class="table table-responsive table-bordered">
                <thead>
                <tr>
                    <th></th>
                    <th class="post-date">日期</th>
                    <th class="post-title">标题</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="article" items="${articles}">
                    <tr>
                        <td></td>
                        <td class="post-date">${article.date}</td>
                        <td class="post-title">
                            <a href="${pageContext.request.contextPath}/posts/${article.uuid}">${article.title}</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="footer col-md-8 col-md-offset-2 text-center">
    <small> 本作品采用<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.zh">知识共享署名-相同方式共享 3.0 未本地化版本许可协议</a>进行许可。 <br />Theme By[<a href="http://yangwenmai.github.io/">maiyang</a>]</small>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>