<%--
  Created by IntelliJ IDEA.
  User: Mark
  Date: 2015/2/15
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <title>Writing</title>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/editormd.css" />
    <style>
        .form-inline .form-control{
            width:300px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/manage">
                <span class="site-name">MarkMind</span>
                <small class="site-motto">Start Blogging</small>
            </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/manage">主页</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div  class="col-md-8 col-md-offset-2 pull-right">
            <form action="${pageContext.request.contextPath}/manage/posts/add" method="post" class="form-inline">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" name="title" class="form-control" id="title" placeholder="Title">
                </div>
                <input type="hidden" id="text" name="text" />
                <button type="submit" class="btn btn-default" onclick="setData()">Post</button>
            </form>
        </div>
    </div>
</div>
<div id="layout">
    <div id="test-editormd">
                <textarea style="display:none;">
</textarea>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/lib/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/editormd.js"></script>
<script type="text/javascript">
    var testEditor;

    $(function() {

        testEditor = editormd("test-editormd", {
            width: "90%",
            height: 550,
            tex  : true,
            path : '../../assets/js/lib/' //根据当前URL路径来设置路径，再editormd.js需要加载codemirror
        });

    });

    function setData() {
        document.getElementById("text").value = encodeURI(testEditor.getMarkdown());
    }
</script>
</body>
</html>