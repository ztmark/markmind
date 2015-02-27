<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage</title>

    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <script>
        function del(t) {

            var delthis = confirm("确定要删除该条记录？");

            if (!delthis) {
                return;
            }

            var gp = t.parentNode.parentNode;
            var tbl = gp.parentNode;
            var uuid = gp.firstElementChild.firstElementChild.value;
            var httpRequest;
            if (window.XMLHttpRequest) {
                httpRequest = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                try {
                    httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {}
                }
            }

            httpRequest.onreadystatechange = function () {
                tbl.removeChild(gp);
            };

            httpRequest.open("POST","${pageContext.request.contextPath}/posts/delete/"+encodeURIComponent(uuid));
            httpRequest.send(null);
        }
    </script>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <span class="site-name">MarkMind</span>
                <small class="site-motto">Start Blogging</small>
            </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/setting">设置</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="pull-right">
                <a href="${pageContext.request.contextPath}/posts/add" type="button" class="btn btn-lg btn-success" >新建</a>
            </div>
            <table class="table table-responsive table-bordered">
                <thead>
                <tr>
                    <th></th>
                    <th class="post-date">日期</th>
                    <th class="post-title">标题</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="article" items="${articles}">
                    <tr>
                        <td><input type="hidden" value="${article.uuid}" /></td>
                        <td class="post-date">${article.date}</td>
                        <td class="post-title">
                            <a href="posts/${article.uuid}">${article.title}</a>
                        <td>
                            <a href="posts/update/${article.uuid}" >更新</a>
                            <a href="javascript:void(0)" onclick="del(this)" >删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>