<%--
  Created by IntelliJ IDEA.
  User: Mark
  Date: 2015/2/17
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Message</title>

    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.1.min.js"></script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
            background-color: #eee;
        }
    </style>
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
                <li><a href="#">Sign Up</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">

    <div class="col-md-6 col-md-offset-3 text-info" style="text-align: center; margin-top: 100px">
        ${msg}
    </div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
    setTimeout("location.href='${url}'", 3000);
</script>
</body>
</html>