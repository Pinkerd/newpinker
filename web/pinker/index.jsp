<%@ page import="com.pinker.entity.pk_user" %>
<%@ page import="com.pinker.service.TopicService" %>
<%@ page import="com.pinker.service.serviceimpl.TopicServiceImpl" %>
<%@ page import="com.pinker.entity.Page" %>
<%@ page import="com.pinker.entity.pk_topic" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>知性网</title>
    <%@include file="/WEB-INF/include/base_info.jsp"%>
    <link rel="stylesheet" type="text/css" href="pinker/css/homepage.css"/>
    <link href="pinker/css/reset.css" rel="stylesheet" type="text/css">
    <link href="pinker/css//font-awesome.css" rel="stylesheet" type="text/css">
    <link href="pinker/css/showlist.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="pinker/js/modernizr.custom.js"></script>

</head>
<body>



    <%--外层盒子--%>
    <div class="box">

        <%--头部导航--%>
        <div class="header">
            <%--网站名字--%>
            <div class="logoTitle">SaO</div>
            <%--注册登录--%>
                <c:if test="${user==null}">
            <div class="loginRegist">
                <div class="lrButton"><a href="pinker/login.jsp">登录</a></div>
                <div class="lrButton"><a href="pinker/login.jsp">注册</a></div>
            </div>
                </c:if>
        </div>

        <%--标语slogen--%>
        <div class="slogen">
            <a>S</a>exy  &nbsp;&nbsp;and &nbsp; <a>O</a>pen
        </div>

        <div class="slogenC">
            <span>知识</span>从未如此<span>性感</span>与<span>开放</span>
        </div>
       <%-- 用户头像保持--%>
                <c:if test="${user!=null}">
                    <div class="headerName">
                        <span class="userName">${user.username}</span>
                        <img src="http://localhost:8080/pinker/IOServlet?method=loadHeadImg" height="20px" width="20px">
                    </div>
                </c:if>
         <%--功能列表 首页 发现  话题--%>
            <div class="funcList">
                <ul class="funcUl">
                    <li class="funcLi"><a href="#">首页</a></li>
                    <li class="funcLi"><a href="#">发现</a></li>
                    <li class="funcLi"><a href="#">话题</a></li>
                </ul>
            </div>

        <%--开始发现之旅--%>
            <a href="#down">
        <div class="downBox">
            <div class="startDiscover">
                <h2>开始知识的旅程</h2>
                <img src="pinker/img/arrowDown.png" style="margin: 0px auto;width: 100px;height: 50px">
            </div>
        </div>
            </a>
        <%--banner--%>
        <div class="banner">
            <%--背景动画--%>
            <iframe src="pinker/banner.html" style="width: 100%;height: 100%;"></iframe>
        </div>

        <%--中间方块展示部分--%>
        <div class="section">
            <div class="secInner">
                <a name="down"></a>


               <%
                   TopicService topicService=new TopicServiceImpl();
                   Page<pk_topic> topicPage=new Page();
                   topicPage.setPageSize(9);
                   topicPage.setPageNumber(1);
                   topicPage=topicService.findTopic(topicPage);
                   List<pk_topic> topicList=topicPage.getData();
                    request.setAttribute("topicList",topicList);
               %>


                <c:forEach items="${topicList}" var="topic">

                    <!-- 图片标题作者1 -->
                    <div class="showListImages">
                        <div class="showbox">
                            <div class="showlist" style="overflow: hidden;">
                                <div class="single-item single-item-1" style="position: absolute; left: 0px;">
                                    <div class="single-item-main">
                                        <div class="single-icon">
                                            <ul class="grid cs-style-5">
                                                <li>
                                                    <figure>
                                                        <img src="http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId=${topic.id}" width="380" height="240">
                                                        <figcaption>
                                                            <h3>Web Design</h3>
                                                            <span>Rasty James</span> <a href="#" class="button">
                                                            <button class="btn btn-blue btn-3blue fa fa-share">查看详情</button>
                                                        </a> </figcaption>
                                                    </figure>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            <!-- 图片标题作者1 -->
            <div class="showListImages">
                <div class="showbox">
                    <div class="showlist" style="overflow: hidden;">
                        <div class="single-item single-item-1" style="position: absolute; left: 0px;">
                            <div class="single-item-main">
                                <div class="single-icon">
                                    <ul class="grid cs-style-5">
                                        <li>
                                            <figure>
                                                <img src="pinker/img/image02.jpg" width="380" height="240">
                                                <figcaption>
                                                    <h3>Web Design</h3>
                                                    <span>Rasty James</span> <a href="#" class="button">
                                                    <button class="btn btn-blue btn-3blue fa fa-share">查看详情</button>
                                                </a> </figcaption>
                                            </figure>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 图片标题作者2 -->
            <div class="showListImages">
                <div class="showbox">
                    <div class="showlist" style="overflow: hidden;">
                        <div class="single-item single-item-1" style="position: absolute; left: 0px;">
                            <div class="single-item-main">
                                <div class="single-icon">
                                    <ul class="grid cs-style-5">
                                        <li>
                                            <figure>
                                                <img src="pinker/img/image01.jpg" width="380" height="240">
                                                <figcaption>
                                                    <h3>Web Design</h3>
                                                    <span>Rasty James</span> <a href="#" class="button">
                                                    <button class="btn btn-blue btn-3blue fa fa-share">查看详情</button>
                                                </a> </figcaption>
                                            </figure>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 图片标题作者3 -->
            <div class="showListImages">
                <div class="showbox">
                    <div class="showlist" style="overflow: hidden;">
                        <div class="single-item single-item-1" style="position: absolute; left: 0px;">
                            <div class="single-item-main">
                                <div class="single-icon">
                                    <ul class="grid cs-style-5">
                                        <li>
                                            <figure>
                                                <img src="pinker/img/image04.jpg" width="380" height="240">
                                                <figcaption>
                                                    <h3>Web Design</h3>
                                                    <span>Rasty James</span> <a href="#" class="button">
                                                    <button class="btn btn-blue btn-3blue fa fa-share">查看详情</button>
                                                </a> </figcaption>
                                            </figure>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 图片标题作者4 -->
            <div class="showListImages">
                <div class="showbox">
                    <div class="showlist" style="overflow: hidden;">
                        <div class="single-item single-item-1" style="position: absolute; left: 0px;">
                            <div class="single-item-main">
                                <div class="single-icon">
                                    <ul class="grid cs-style-5">
                                        <li>
                                            <figure>
                                                <img src="pinker/img/image03.jpg" width="380" height="240">
                                                <figcaption>
                                                    <h3>Web Design</h3>
                                                    <span>Rasty James</span> <a href="#" class="button">
                                                    <button class="btn btn-blue btn-3blue fa fa-share">查看详情</button>
                                                </a> </figcaption>
                                            </figure>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 图片标题作者5 -->
            <div class="showListImages">
                <div class="showbox">
                    <div class="showlist" style="overflow: hidden;">
                        <div class="single-item single-item-1" style="position: absolute; left: 0px;">
                            <div class="single-item-main">
                                <div class="single-icon">
                                    <ul class="grid cs-style-5">
                                        <li>
                                            <figure>
                                                <img src="pinker/img/image02.jpg" width="380" height="240">
                                                <figcaption>
                                                    <h3>Web Design</h3>
                                                    <span>Rasty James</span> <a href="#" class="button">
                                                    <button class="btn btn-blue btn-3blue fa fa-share">查看详情</button>
                                                </a> </figcaption>
                                            </figure>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 图片标题作者6 -->
            <div class="showListImages">
                <div class="showbox">
                    <div class="showlist" style="overflow: hidden;">
                        <div class="single-item single-item-1" style="position: absolute; left: 0px;">
                            <div class="single-item-main">
                                <div class="single-icon">
                                    <ul class="grid cs-style-5">
                                        <li>
                                            <figure>
                                                <img src="pinker/img/image01.jpg" width="380" height="240">
                                                <figcaption>
                                                    <h3>Web Design</h3>
                                                    <span>Rasty James</span> <a href="#" class="button">
                                                    <button class="btn btn-blue btn-3blue fa fa-share">查看详情</button>
                                                </a> </figcaption>
                                            </figure>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 图片标题作者7 -->
            <div class="showListImages">
                <div class="showbox">
                    <div class="showlist" style="overflow: hidden;">
                        <div class="single-item single-item-1" style="position: absolute; left: 0px;">
                            <div class="single-item-main">
                                <div class="single-icon">
                                    <ul class="grid cs-style-5">
                                        <li>
                                            <figure>
                                                <img src="pinker/img/image04.jpg" width="380" height="240">
                                                <figcaption>
                                                    <h3>Web Design</h3>
                                                    <span>Rasty James</span> <a href="#" class="button">
                                                    <button class="btn btn-blue btn-3blue fa fa-share">查看详情</button>
                                                </a> </figcaption>
                                            </figure>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 图片标题作者8 -->
            <div class="showListImages">
                <div class="showbox">
                    <div class="showlist" style="overflow: hidden;">
                        <div class="single-item single-item-1" style="position: absolute; left: 0px;">
                            <div class="single-item-main">
                                <div class="single-icon">
                                    <ul class="grid cs-style-5">
                                        <li>
                                            <figure>
                                                <img src="pinker/img/image03.jpg" width="380" height="240">
                                                <figcaption>
                                                    <h3>Web Design</h3>
                                                    <span>Rasty James</span> <a href="#" class="button">
                                                    <button class="btn btn-blue btn-3blue fa fa-share">查看详情</button>
                                                </a> </figcaption>
                                            </figure>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 图片标题作者9 -->
            <div class="showListImages">
                <div class="showbox">
                    <div class="showlist" style="overflow: hidden;">
                        <div class="single-item single-item-1" style="position: absolute; left: 0px;">
                            <div class="single-item-main">
                                <div class="single-icon">
                                    <ul class="grid cs-style-5">
                                        <li>
                                            <figure>
                                                <img src="pinker/img/image02.jpg" width="380" height="240">
                                                <figcaption>
                                                    <h3>Web Design</h3>
                                                    <span>Rasty James</span> <a href="#" class="button">
                                                    <button class="btn btn-blue btn-3blue fa fa-share">查看详情</button>
                                                </a> </figcaption>
                                            </figure>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            </div>


        <%--section--%>
        </div>

        <%--页脚部分--%>
        <div class="footer">
            <%--信息--%>
            <div id="baseInfo">
                <div class="infoBanner">
                    <div class="infoBox">
                        <div class="infoTitle">------我们在这-----</div>
                        <span>南京市雨花台区小行路16号</span>
                    </div>
                    <div class="infoBox">
                        <div class="infoTitle">------欢迎电邮------</div>
                        <span>025-xxxxxxxx</span><br>
                        <span>xxxxx@xxx.com</span>
                    </div>
                    <div class="infoBox">
                        <div class="infoTitle" style="margin: 0px auto 10px;">------关注我们------</div>
                        <img src="pinker/img/Contact_wechat.png"   id="wechat"  >
                        <img src="pinker/img/Contact_QQ.png"   id="qq" >
                        <img src="pinker/img/Contact_weibo.png"   id="weibo" ><br>
                        <img src="pinker/img/2Dcode.png" class="Dcode1">
                        <img src="pinker/img/2Dcode.png" class="Dcode2">
                        <img src="pinker/img/2Dcode.png" class="Dcode3">
                    </div>
                </div>
            </div>
            <%--信息--%>


                <%--相关连接--%>
                <div id="baseInfo" style="padding-top: 40px">
                    <div class="infoBanner">
                        <div class="infoBox">
                            <div class="infoTitle">------相关连接------</div>
                            <span><a href="#">首页</a></span>&nbsp;&nbsp;
                            <span><a href="#">发现</a></span>&nbsp;&nbsp;
                            <span><a href="#">话题</a></span>
                        </div>
                        <div class="infoBox">
                            <div class="infoTitle">------合作网站------</div>
                            <span><a href="#">知乎</a></span>&nbsp;&nbsp;
                            <span><a href="#">百度</a></span>&nbsp;&nbsp;
                            <span><a href="#">微博</a></span>

                        </div>
                        <div class="infoBox">
                            <div class="infoTitle" style="margin: 10px auto">知性网</div>
                           <span> Copyright 	&copy;</span>
                            <span>1998 - 2018 SaO.Company All Rights Reserved</span>
                        </div>
                    </div>
                </div>
                <%--连接--%>

        </div>

    </div>

    <script type="text/javascript" src="pinker/js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            /*头部淡入*/
            $(".header").fadeIn(3000);
            $(".funcList").fadeIn(5000);
            /*标语延迟进入*/
            setTimeout(function () {
                $(".slogenC").fadeIn(5000);
                }, 1000);
            setTimeout(function () {
                $(".slogen").fadeIn(5000);
            }, 2000);

           /*向下开始淡入*/
            setTimeout(function () {
                $(".downBox").fadeIn(5000);
            }, 4000);

            /*关注我们*/
            $("#wechat").click(function () {
                $(".Dcode1").toggle();
            })

            $("#qq").click(function () {
                $(".Dcode2").toggle();
            })

            $("#weibo").click(function () {
                $(".Dcode3").toggle();
            })

        })
    </script>

    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <script type="text/javascript">
        $(function(){
            //锚点跳转滑动效果
            $('a[href=#down],a[name=down]').click(function() {
                console.log(this.pathname)
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                    var $target = $(this.hash);
                    $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
                    if ($target.length) {
                        var targetOffset = $target.offset().top;
                        $('html,body').animate({
                                scrollTop: targetOffset
                            },
                            1000);
                        return false;
                    }
                }
            });
        })
    </script>





    <script type="text/javascript" src="pinker/js/jquery.min.js"></script>
    <script type="text/javascript" src="pinker/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="pinker/js/jquery.contentcarousel.js"></script>
    <script type="text/javascript">
        $('#showbox').contentcarousel();;
    </script>

</body>
</html>