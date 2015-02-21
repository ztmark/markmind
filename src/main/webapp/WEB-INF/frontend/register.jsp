<%--
  Created by IntelliJ IDEA.
  User: Mark
  Date: 2015/2/16
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Post</title>

    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.1.min.js"></script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
            background-color: #eee;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input {
            margin-bottom: 10px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
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
                <li><a href="signin">Sign In</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">

    <form action="${pageContext.request.contextPath}/signup" method="post" class="form-signin">
        <span id="message" class="text-danger">${msg}</span>
        <h2 class="form-signin-heading">Please Sign Up</h2>
        <label for="inputUsername" class="sr-only">Username</label>
        <input name="username" type="text" id="inputUsername" class="form-control" placeholder="Username" required autofocus>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <label for="confirmPassword" class="sr-only">Password</label>
        <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm Password" required>

        <button id="submit" class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
    </form>

</div>


<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
    (function(){
        $("form").submit(function(e) {
            var pwd1 = $("#inputPassword").val();
            var pwd2 = $("#confirmPassword").val();
            var msg = $("#message");
            if (pwd1.length < 6) {
                msg.text("密码太短");
                e.preventDefault();
            } else if (pwd1 !== pwd2) {
                msg.text("两次密码不一致");
                e.preventDefault();
            }
        });
    })();
</script>
</body>
</html>