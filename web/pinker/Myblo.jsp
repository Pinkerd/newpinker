<%@ page import="com.pinker.service.BlogDaoService" %>
<%@ page import="com.pinker.service.Impl.BlogDaoServiceImpl" %>
<%@ page import="com.pinker.entity.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/include/base_info.jsp"%>
		<link rel="stylesheet" type="text/css" href="pinker/css/Template.css" />
		<link rel="stylesheet" type="text/css" href="pinker/css/PersonPage.css" />
		<link rel="stylesheet" type="text/css" href="pinker/css/myblo.css"/>
		<link rel="stylesheet" type="text/css" href="pinker/css/myblo1.css"/>
		<link rel="stylesheet" type="text/css" href="pinker/css/head_info.css">
		<script src="pinker/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="pinker/js/Template.js"></script>
		<script type="text/javascript" src="pinker/js/personpage.js"></script>
		<title></title>



	</head>

	<body>

	<%
		BlogDaoService blog=new BlogDaoServiceImpl();
		pk_user userMy = (pk_user) request.getSession().getAttribute("user");

		Integer id = userMy.getId();

		List<Blog> usersBlog = blog.findUser(id);
		request.setAttribute("usersBlog",usersBlog);
	%>


		<!--模板容器-->
		<div class="template-body">
			<!--头部容器-->
			
			<%@include file="/WEB-INF/include/head_info.jsp"%>


			<!--模板结束-->
			<div class="template-main-body">
				<!--头像与背景显示-->
				
				<%@include file="/WEB-INF/include/headimg_info.jsp"%>
				

				<div class="template-body-left">
					<!--在这里写左边-->
					
					<!--左侧状态栏-->
					<div class="left-status">
						<ul class="left-statusUl">
							<li class="left-status-sate statusActive">动态</li>
							<li class="left-status-publish">发布</li>
							<li class="left-status-attention">收藏与关注</li>
							<li class="left-status-perInfo">个人信息</li>
						</ul>
					</div>
					
					<!--个人信息-->

					<!--收藏的博文-->
					<div class="left-attentionBlog">

						<c:forEach items="${usersBlog}" var="blog">
						<div class="blog-wrap">
							<div class="blog-title-wrap">
								<a href="/pinker/BlogServlet?method=selectblogOne&blogId=${blog.id}">${blog.title}</a>
							</div>
							<div class="blog-info">
								<span>${blog.publishtime}</span>·<span>16 个回答</span>·<span>55 个关注</span>
							</div>
						</div>
						</c:forEach>


					</div>
					<!--发布的话题-->
					<div class="left-myTopic">

					</div>

					<!--发布的博文-->
					<div class="left-myBlog">

					</div>

				</div>

				<div class="template-body-right">
					<!--在这里写右边-->

					<!--关注数-->
					<div class="statistics">
						<div class="attentionCount">
							<h3>345</h3>
							<span>关注</span>
						</div>

						<div class="funsCount">
							<h3>234</h3>
							<span>被关注</span>
						</div>
					</div>


					<!--右侧-->
					<div class="right-menu">
						<ul>
							

							<div class="menu-attentionTopic">
								<li>关注的话题</li>
							</div>

							<div class="menu-attentionBlog">
								<a href="CollectionBlogServlet">
								<li>收藏的博文</li>
								</a>
							</div>

							<div class="menu-myTopic">
								<li>发布的话题</li>
							</div>

							<div class="menu-myBlog">
								<li>发布的博文</li>
							</div>

							

						</ul>

					</div>

					<div class="right-myFriend">
						<div class="friend-nav">
							<h3>好友</h3>
						</div>
						
						<hr />
						<div class="right-friendwarp">
							<div class="right-headIMG left">
								<img src="img/headimg/111.jpg" height="50px" width="50px" />
							</div>
							<div class="right-friendInfo">
								<a href="PersonPage.jsp">
									<h4>时间高手</h4></a>
								<span class="introduce">人最软弱的地方，是舍不得。</span>
							</div>
							<div id="friend-manager">

							</div>
						</div>

						<div class="right-friendwarp">
							<div class="right-headIMG left">
								<img src="img/headimg/ti111mg.jpg" height="50px" width="50px" />
							</div>
							<div class="right-friendInfo">
								<a href="PersonPage.jsp">
									<h4>David Lee</h4></a>
								<span class="introduce">我爱你你却爱她，先森 </span>
							</div>
							<div class="friend-manager">

							</div>
						</div>

						<div class="right-friendwarp">
							<div class="right-headIMG left">
								<img src="img/headimg/ti1mg.jpg" height="50px" width="50px" />
							</div>
							<div class="right-friendInfo">
								<a href="PersonPage.jsp">
									<h4>我的小贱贱</h4></a>
								<span class="introduce">我知道你爱她命里少我一个也没差</span>
							</div>
							<div class="friend-manager">

							</div>
						</div>

						<div class="right-friendwarp">
							<div class="right-headIMG left">
								<img src="img/headimg/ti66mg.jpg" height="50px" width="50px" />
							</div>
							<div class="right-friendInfo">
								<a href="PersonPage.jsp">
									<h4>建民质疑</h4></a>
								<span class="introduce">良人未归途我念故人归</span>
							</div>
							<div class="friend-manager">

							</div>
						</div>

						<div class="right-friendwarp">
							<div class="right-headIMG left">
								<img src="img/headimg/tim11g.jpg" height="50px" width="50px" />
							</div>
							<div class="right-friendInfo">
								<a href="PersonPage.jsp">
									<h4>Party Time</h4></a>
								<span class="introduce">不要暗示我，我知道暗室欺人</span>
							</div>

						</div>

						<div class="friend-manager">
							<button class="friend-up">上一页</button>
							<input readonly="" type="text" name="pageCode" id="pageCode" value="1/178" class="friend-pageCode" />
							<button class="friend-down">下一页</button>
						</div>

					</div>

				</div>
			</div>

		</div>

	</body>

</html>