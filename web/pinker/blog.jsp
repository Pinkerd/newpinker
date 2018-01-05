<%@ page import="java.security.Key" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<base href="http://localhost:8080/pinker/pinker/">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Template.css" />
	<link rel="stylesheet" type="text/css" href="css/Blog.css">
	<link rel="stylesheet" type="text/css" href="css/left.css" />
	<link rel="stylesheet" type="text/css" href="css/right.css" />


	<title></title>
</head>

<body>
<!--模板容器-->
<div class="template-body">
	<!--头部容器-->
	<div class="template-header">
		<div class="template-header-wrap">
			<span class="template-logo">品客·</span>
			<nav class="template-header-nav">
				<a href="index.jsp" class="template-header-navItem isActive">首页</a>
				<a href="#" class="template-header-navItem">发现</a>
				<a href="topicList.jsp" class="template-header-navItem">话题</a>
			</nav>
			<!--搜索框-->

			<div class="template-search-bar">
				<input type="text" name="" id="" value="" placeholder="你感兴趣的话题。。。" />

			</div>
			<div class="template-search-buttonWrap">
				<input type="button" class="template-search-button" />
			</div>
			<!--右侧登录注册以及头像-->
			<div class="right template-header-right">
				<div class="template-loginRegist">
					<a href="login.jsp">登录</a>
					<a href="login.jsp">注册</a>
				</div>

				<div class="template-userInfo">
					<div class="head-img">
						<a href="#"><img src="pinker/img/default_head.png" height="40px" width="40px" /></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--论题-->

	<div class="page_top">
		<!--论题头部-->
		<div class="page_topHeader">
			<!--讨论话题的内容-->
			<div class="page_topcontent">
				<div class="page-border">
					<div class="page_topcontentmain">
						<div class="page_topcontenttags">
							<div class="page_topcontenttopics">
								<div class="page_topcontentTopics">
									<a href="topic_blogList.jsp">社交网络</a>
								</div>
								<div class="page_topcontentTopics">
									<a href="topic_blogList.jsp">心理学</a>
								</div>
								<div class="page_topcontentTopics">
									<a href="topic_blogList.jsp">人际交往</a>
								</div>
								<div class="page_topcontentTopics">
									<a href="topic_blogList.jsp">社交产品</a>
								</div>
								<div class="page_topcontentTopics">
									<a href="topic_blogList.jsp">互联网社交</a>
								</div>
							</div>
						</div>
						<h1 class="page_topcontenttitle">
							${key.title}
						</h1>
						<%--<div class="page_topcontentdetail">
                            <span class="RichText">最近贾樟柯导演拍了新短片，
                            讲 3 个年轻人因为陌陌找到同类化解孤独。目前社交网络越来越发达，
                            这种突破地域和空间的限制，强调人与人之间的连接，是否会对人…</span>
                        </div>--%>
					</div>

					<div class="page_topcontentside">
						<div class="page-collector">
							<div class="collector-name">收藏者</div>
							<div class="collector-value">4875</div>
						</div>
						<div class="item">
							<div class="item-name">被浏览</div>
							<div class="item-value">509544</div>
						</div>

					</div>
					<!--讨论论题的底部-->
					<div class="page_topfoot">
						<div class="page_topfootmain">
							<div class="page_topfootGroup">
								<button class="page-attention">关注问题</button>
								<a class="page-review" href="#">我要评论</a>
							</div>
							<div class="page_topfootAction">
								<div class="page_topfootActioncomment">
									<button class="button3">
										<img class="button3-img" src="img/评论.png" width="20px " height="20px"/>
										5条评论
									</button>
								</div>
								<div class="page_topfootActionshareMenu">
									<button class="button4">
										<img src="img/分享.png" width="20px" height="20px"/>
										转发
									</button>
								</div>
							</div>
						</div>

					</div>



				</div>
			</div>


		</div>

	</div>

	<!--模板结束-->
	<div class="template-main-body">
		<div class="template-body-left">
			<!--在这里写左边-->
			<div class="data-reactid">
				<div class="contentITem-meta">
					<div class="author-info">
						<div class="Popover">
							<img src="img/rBACE1QVCzTBwmNzAAC99vs-BW0180_200x200_3.png" width="37px" height="37px" />
						</div>
						<div class="AuthorInfo-content">
							<div class="AuthorInfo-head">
								<a href="#">
									${key.user.username}
								</a>
							</div>
							<div class="AuthorInfo-detail">
								人人都能看懂，但只有一部分人才会喜欢的泛心理学
							</div>
						</div>

					</div>
					<div class="AnswerItem-extraInfo">
						收录于 编辑推荐 &nbsp;圆桌 299 人赞同了该回答
					</div>

				</div>
				<div class="RichContent-inner">
							<span class="RichText">
								${key.content}
							</span>
				</div>
				<div class="ContentItem-time">
					<a href="#">编辑于 2017-02-28</a>
				</div>

				<div class="ContentItem-actions">
							<span>
								<button  class="left-Thumb">
									<img src="img/点赞.png" width="25px" height="20px" id="zan"/>
								</button>

							</span>
					<button class="left-comment">
						<img class="button3-img" src="img/评论.png" width="20px" height="20px" style="position: relative;bottom: 7px;"/>
						<a style="display: inline-block;position: relative;bottom:2px;left: 6px;">22条评论</a>
					</button>

					<button class="left-dividual">
						<img src="img/分享.png" width="20px" height="20px" style="position: relative;top: 3px;"/>
						<a style="display: inline-block;position: relative;bottom:2px;left: 4px;">分享</a>
					</button>

					<button class="left-collect">
						<img src="img/收藏.png" width="20px" height="20px" style="position: relative;top: 3px;"/>
						<a style="display: inline-block;position: relative;bottom:2px;left: 4px;">收藏</a>
					</button>
				</div>
				<%--评论框--%>
				<div class="Comments-container">
					<div class="Comments-top">
						<div class="Topbar-title">
							<div>
								<h2>22条评论</h2>
							</div>
						</div>

					</div>
					<hr />

					<div>
						<div class="commentList">

							<div class="CommentItem">
								<div>
									<div class="CommentItem-meta">
										<div class="Popover">
											<img src="img/de6b65d85e1d9434!400x400_big.jpg" width="23px" height="23px" alt="熊本熊" /> 熊本熊
										</div>
									</div>

									<div class="CommentItem-content">
										<p>有的人只活在线上而忽略了线下。最后线上线下都失去了那才叫一种孤独！</p>
									</div>

									<div class="CommentItem-footer">
										<button class="CommentItem-Thumb">
											<img src="img/点赞.png" width="25px" height="20px"/>赞
										</button>

										<button class="CommentItem-revert">
											<img src="img/回复.png" width="16px" height="16px"/>回复
										</button>

									</div>

								</div>
								<hr />
							</div>

						</div>
					</div>

					<div class="Comments-foot">
						<form action="/pinker/BlogServlet?method=insertComment" method="post">
							<div class="foot-comment"><input type="text" name="comment" placeholder="写下你的评论" />
								<button type="submit" id="foot-comment">评论</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="template-body-right">
			<!--在这里写右边-->
			<div class="Card">
				<div class="Cardhead">
					<div class="CardheadText">相关问题</div>
					<hr />
				</div>
				<div class="Cardsection">
					<div class="Cardsectionitem">
						<a href="blog.jsp" target="_blank">你最孤独的时刻是什么？</a>
						22733个回答
					</div>
					<div class="Cardsectionitem">
						<a href="blog.jsp" target="_blank">生活中有哪些常见且易被忽略的不礼貌行为？</a>
						1288个回答
					</div>
					<div class="Cardsectionitem">
						<a href="blog.jsp" target="_blank">好友间的关系是如何变淡的？</a>
						9837个回答
					</div>
					<div class="Cardsectionitem">
						<a href="blog.jsp" target="_blank">什么时候会让你觉得群众是愚蠢的？</a>
						6228个回答
					</div>
					<div class="Cardsectionitem">
						<a href="blog.jsp" target="_blank">朋友圈里常发什么样的图片的人比较讨厌</a>
						3021个回答
					</div>

				</div>

			</div>

		</div>
	</div>

</div>

</body>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#zan").click(function () {
            /*  $("#zan").attr("src", "img/已赞.png");*/

            if($("#zan").attr("src")=="img/点赞.png"){
                $("#zan").attr("src", "img/已赞.png");
            }else{
                $("#zan").attr("src", "img/点赞.png");
            }

        })

    })
</script>
<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/Template.js"></script>
<script type="text/javascript">
    /**
     *  评论框的显示和隐藏
     */
    $(document).ready(function() {
        $(".left-comment").click(function() {
            /*   $(".Comments-container").toggle();*/
            $(".Comments-container").slideToggle(700);
        });
    });
    /**
     *  关注问题和取消关注
     */
    $(function(){
        $(".page-attention").toggle(

            function() {$(".page-attention").html("关注问题");},
            function() {$(".page-attention").html("取消关注");}
        )
    })
</script>



</html>