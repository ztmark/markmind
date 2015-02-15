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
    <title>Manage</title>

    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="assets/css/main.css" />
    <script src="assets/js/jquery-2.1.1.min.js"></script>
    <style type="text/css">
        .panel {
            border-top: none;
            height: 250px;
            padding: 50px 30px;
        }
        .hide {
            display: none;
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
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <span class="site-name">MarkMind</span>
                <small class="site-motto">Start Blogging</small>
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">主页</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <ul class="nav nav-tabs">
                <li id="general" role="presentation" class="active" onclick="hidePwd()"><a href="javascript:void(0)" >General</a></li>
                <li id="pwd" role="presentation" onclick="showPwd()"><a href="javascript:void(0)" >Password</a></li>
            </ul>
            <form id="blog-form" class="form-horizontal panel panel-default">
                <div class="form-group">
                    <label for="blog-name" class="col-sm-3 control-label">Blog Name</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="blog-name" placeholder="Blog Name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="motto" class="col-sm-3 control-label">Motto</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="motto" placeholder="Motto">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Save</button>
                    </div>
                </div>
            </form>

            <form id="pwd-form" class="form-horizontal panel panel-default hide">
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password" placeholder="Password">
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


<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="assets/js/bootstrap.min.js"></script>

</body>
</html>