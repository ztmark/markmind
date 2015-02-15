<%--
  Created by IntelliJ IDEA.
  User: Mark
  Date: 2015/2/15
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>index</title>

    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/github.css" />

</head>
<body>
<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <span class="site-name">Mark's Blog</span>
                <small class="site-motto">Never Stop Learning</small>
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">About</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="article">
                <h2>使用Git之安装设置</h2>
                <div class="article-info">
                    <span class="glyphicon glyphicon-calendar"></span><time>2014-11-15</time>
                </div>
                <div id="content" class="content"></div>
                <div id="text" style="display: none;">

                    这是OpneJudge上的一道大数四则运算题，可以点击[这里](http://cxsjsxmooc.openjudge.cn/hw4/A/)查看题目。

                    这里写的大数类有一下一些局限

                    - 只支持正整数的运算
                    - 除法向下取整，不支持小数
                    - 支持100位的大数，不过可以通过修改数组大小来支持更大的数

                    这道题提交了19次才AC，前面几次在Ubuntu13.10下运行都是正确的，而一提交就WA，这种情况调试都很难调啊，都不知哪里出错了，设断点，一步一步看都看不出错误。

                    最后，到Windows下去运行了一下，果然出错了，设了断点，调试了一下，发现从操作符重载函数里返回本地的大数类时并没有调用复制构造函数。后来再仔细看了一下，原来所有的操作符重载函数的返回值都写成了大数类的引用了。

                    [这里](http://blog.csdn.net/sxhelijian/article/details/7466540)有一篇讲引用和返回值的文章可以看看。

                    下面是完整的代码
                    ```
                    public class Demo {
                    public static void main(String[] args) {
                    System.out.println("Hello World");
                    System.out.println("Bye);
                    }
                    }

                    ```
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer col-md-8 col-md-offset-2 text-center">
    <small> 本作品采用<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.zh">知识共享署名-相同方式共享 3.0 未本地化版本许可协议</a>进行许可。 <br />Theme By[<a href="http://yangwenmai.github.io/">maiyang</a>]</small>
</div>

<script src="assets/js/jquery-2.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/marked.js" type="text/javascript" charset="utf-8"></script>
<script src="assets/js/highlight.pack.js" type="text/javascript" charset="utf-8"></script>
<script>
    var text = document.getElementById("text").innerHTML;
    document.getElementById("content").innerHTML = marked(text);
    hljs.initHighlightingOnLoad();
</script>
</body>
</html>