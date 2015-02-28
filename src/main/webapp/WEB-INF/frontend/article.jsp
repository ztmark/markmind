<%--
  Created by IntelliJ IDEA.
  User: Mark
  Date: 2015/2/25
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>article</title>

    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/editormd.preview.min.css" />

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
            <div class="article">
                <h2>${article.title}</h2>
                <div class="article-info">
                    <span class="glyphicon glyphicon-calendar"></span><time>${article.date}</time>
                </div>
                <div id="content" class="content">
                    <textarea style="display:none;"></textarea>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer col-md-8 col-md-offset-2 text-center">
    <small> 本作品采用<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.zh">知识共享署名-相同方式共享 3.0 未本地化版本许可协议</a>进行许可。 <br />Theme By[<a href="http://yangwenmai.github.io/">maiyang</a>]</small>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/marked.js" type="text/javascript" charset="utf-8"></script>
<%--<script src="${pageContext.request.contextPath}/assets/js/highlight.pack.js" type="text/javascript" charset="utf-8"></script>--%>
<script src="${pageContext.request.contextPath}/assets/js/lib/prettify.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/editormd.js"></script>
<script type="text/javascript">
    var testEditormdView;

    $(function() {
        function load(markdown) {
            testEditormdView = editormd.markdownToHTML("content", {
                markdown : decodeURI(markdown),     // 不设置时，从<script type="text/markdown">获取markdown文档
                htmlDecode : true,       // 开启HTML标签解析，为了安全性，默认不开启
                tex : true              // 默认不解析
            });

            //console.log("返回一个jQuery实例 =>", testEditormdView);

            // 获取Markdown源码
            //console.log(testEditormdView.getMarkdown());
        }
        load("${article.text}");
    });
</script>
</body>
</html>