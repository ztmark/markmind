<%--
  Created by IntelliJ IDEA.
  User: Mark
  Date: 2015/2/15
  Time: 21:35
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
        #editor {
            margin: 10px auto;
            position: absolute;
            top: 100px;
            left: 0;
            bottom: 0;
            width: 100%;
        }
        .form-inline .form-control{
            width:300px;
        }
    </style>
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

        <div  class="col-md-8 col-md-offset-2 pull-right">
            <form class="form-inline">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" class="form-control" id="title" placeholder="Title">
                </div>
                <input type="hidden" name="text" />
                <button type="submit" class="btn btn-default">Post</button>
            </form>
        </div>
        <div id="editor">
            Write something...

        </div>
    </div>
</div>


<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
<script>
    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/dawn");
    editor.getSession().setMode("ace/mode/markdown");
    editor.setFontSize(16);
    editor.setOption("fixedWidthGutter",true);
    editor.setOption("hScrollBarAlwaysVisible",true);
    editor.setOption("showInvisibles",false);



    function setData() {
        var text = editor.getSession().getValue();
        document.getElementById("text").value = text;
    }
</script>
</body>
</html>