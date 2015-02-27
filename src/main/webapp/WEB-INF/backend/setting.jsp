<%--
  Created by IntelliJ IDEA.
  User: Mark
  Date: 2015/2/15
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Setting</title>

    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.1.min.js"></script>
    <style type="text/css">
        .panel {
            border-top: none;
            height: 250px;
            padding: 50px 30px;
        }
    </style>
    <script>
        function showPwd() {
            $("#pwd-form").removeClass("hide");
            $("#blog-form").addClass("hide");
            $("#general").removeClass("active");
            $("#pwd").addClass("active");
        }
        function hidePwd() {
            $("#blog-form").removeClass("hide");
            $("#pwd-form").addClass("hide");
            $("#pwd").removeClass("active");
            $("#general").addClass("active");
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
                <li><a href="#">主页</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <ul class="nav nav-tabs">
                <li id="general" role="presentation" class="active" onclick="hidePwd()"><a href="javascript:void(0)" >General</a></li>
                <li id="pwd" role="presentation" onclick="showPwd()"><a href="javascript:void(0)" >Password</a></li>
            </ul>
            <form action="setting" method="post" id="blog-form" class="form-horizontal panel panel-default">
                <div class="form-group">
                    <label for="blog-name" class="col-sm-3 control-label">Blog Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="blog-name" name="blog-name" value="${user.blogName}" placeholder="MarkMind">
                    </div>
                </div>
                <div class="form-group">
                    <label for="motto" class="col-sm-3 control-label">Motto</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="motto" name="motto" value="${user.motto}" placeholder="Start Blogging">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Save</button>
                    </div>
                </div>
            </form>

            <form action="setting" method="post" id="pwd-form" class="form-horizontal panel panel-default hide">
                <span id="message" class="text-danger"></span>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password-confirm" class="col-sm-3 control-label">Password Confirm</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password-confirm" placeholder="Password Confirm">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Save</button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
    (function(){
        $("#pwd-form").submit(function(e) {
            var pwd1 = $("#password").val();
            var pwd2 = $("#password-confirm").val();
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