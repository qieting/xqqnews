<%@ page import="entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>主页</title>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <link href="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/style2.css" rel="stylesheet" type="text/css"
          media="all"/>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!--webfont-->
    <link href='http://fonts.useso.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
          rel='stylesheet' type='text/css'>
    <style>
        ul.top-menu > li > .logout {
            color: #f2f2f2;
            font-size: 12px;
            border-radius: 4px;
            -webkit-border-radius: 4px;
            border: 1px solid #64c3c2 !important;
            padding: 5px 15px;
            margin-right: 15px;
            background: #4ECDC4;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<!-- header-section-starts -->
<div class="header">


    <div class="container">

        <div class="logo">
            <div>
                <a href="index.html"><img src="${pageContext.request.contextPath}/resource/img/friends/fr-09.jpg"
                                          class="img-responsive" alt="" style="width: 100px; height: 100px"/></a>

                <label style="margin-left: 200px;font-size: 40px;margin: 0;color: #ffffff;">看神马新闻</label>
            </div>
            <br>
            <div class="form-panel" style='display:block'>
                <form class="form-inline" role="form"
                      action="/user/seleceByLike" method="post"
                      style="display: contents">
                    <div class="form-group" style="display: contents">
                        <label class="sr-only" for="exampleInput1">模糊查询</label>
                        <span style="color: rebeccapurple" id="tip1"></span>
                        <input type="text" class="form-control" name="selectkey" id="exampleInput1"
                               placeholder="模糊查询">
                    </div>
                    <button type="submit" class="btn btn-theme">查找</button>
                </form>
                <form class="form-inline"
                      action="/user/seleceByKey"
                      style="display: contents">
                    <div class="form-group" style="display: contents">
                        <label class="sr-only" for="exampleInput2">关键字查询</label>
                        <span style="color: rebeccapurple" id="tip2"></span>
                        <input type="text" class="form-control" id="exampleInput2" name="selectkey"
                               placeholder="关键字查询">
                    </div>
                    <button type="submit" class="btn btn-theme">查找</button>
                </form>

            </div>
        </div>




        <div class="header-right">
            <%
                User user = (User) session.getAttribute("user");
                if (user != null) {
            %>
            <h4>欢迎用户<%=user.getUserName()%>
                <ul class="pull-right top-menu">
                    <li><a class="logout"
                           href="${pageContext.request.contextPath}/user/Logout?userName=<%=user.getUserName()%>">Logout</a>
                    </li>
                </ul>
            </h4>
            <%
            } else {
            %>
            <h4>
                <div>未登录</div>
                <ul class="pull-right top-menu">
                    <li><a class="logout" href="${pageContext.request.contextPath}/user/login1.html">ToLogin</a></li>
                </ul>
            </h4>
            <%
                }
            %>

            <span class="menu"></span>
            <div class="top-menu">
                <ul>
                    <li><a class="active" href="#">新闻主页</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/center.html">个人中心</a></li>
                </ul>
            </div>
            <!-- script for menu -->
            <script>
                $("span.menu").click(function () {
                    $(".top-menu").slideToggle("slow", function () {
                        // Animation complete.
                    });
                });
            </script>

            <!-- script for menu -->
        </div>

        <div class="clearfix"></div>
    </div>
</div>
<c:if test="${!result.isSuccess}">
    <span style="color: rebeccapurple">${result.errMes}</span>
</c:if>
<!-- header-section-ends -->
<div class="content">
    <div class="blog-section">
        <div class="container">
            <div class="col-md-8 left_column" style="float: left">
                <h2 class="with-line">新闻列表</h2>
                <c:forEach var="data" items="${newData}">
                    <article class="clearfix">
                        <header class="grid_8 alpha">
                            <div class="sub">
                                <a href="/new/detail?newId=${data.aNew.newId}"
                                   class="readblog">${data.aNew.title}</a>
                                <p class="sub_head">Posted by <a href="#">${data.userName}</a>
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </header>
                        <c:if test="${data.aNew.newId%3==0}">
                            <div class="alpha1"><a href="/new/detail?newId=${data.aNew.newId}"><img
                                    src="${pageContext.request.contextPath}/resource/img/index-3_img-1.jpg" alt=""/></a>
                            </div>
                        </c:if>
                        <c:if test="${data.aNew.newId%3==1}">
                            <div class="alpha1"><a href="single.html"><img
                                    src="${pageContext.request.contextPath}/resource/img/index-3_img-2.jpg" alt=""/></a>
                            </div>
                        </c:if>
                        <c:if test="${data.aNew.newId%3==2}">
                            <div class="alpha1"><a href="single.html"><img
                                    src="${pageContext.request.contextPath}/resource/img/index-3_img-3.jpg" alt=""/></a>
                            </div>
                        </c:if>

                        <div class="grid_b4">
                            <h5>${data.aNew.title}</h5>
                            <p>${data.typeName}|${data.aNew.keyWords}</p>
                            <a href="/new/detail?newId=${data.aNew.newId}" class="btn btn-1 btn-1c">Read More</a>
                        </div>
                        <div class="clearfix"></div>
                    </article>
                </c:forEach>

            </div>

            <div class="col-md-4 right_column" style="float: left;">

                <div class="item2">
                    <header>
                        <h2 class="with-line">与我相关</h2>
                    </header>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/new/editor.html?index=1">添加文章</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/center.html">我发表的文章与评论</a></li>
                    </ul>
                </div>


                <div class="item">
                    <header>
                        <h2 class="with-line">新闻分类</h2>
                    </header>
                    <ul>
                        <li><a href="indexByCategory.html?category=4">社会</a></li>
                        <li><a href="indexByCategory.html?category=1">娱乐</a></li>
                        <li><a href="indexByCategory.html?category=2">军事</a></li>
                        <li><a href="indexByCategory.html?category=5">历史</a></li>
                        <li><a href="indexByCategory.html?category=3">体育</a></li>
                        <li><a href="indexByCategory.html?category=6">法制</a></li>
                    </ul>
                </div>

            </div>


            <div class="clearfix"></div>
        </div>
    </div>
</div>


</body>
</html>