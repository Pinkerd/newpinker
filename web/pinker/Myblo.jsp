<%@ page import="com.pinker.service.BlogDaoService" %>
<%@ page import="com.pinker.service.Impl.BlogDaoServiceImpl" %>
<%@ page import="com.pinker.entity.Blog" %>
<%@ page import="com.pinker.entity.Page" %>
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
		<link rel="stylesheet" type="text/css" href="pinker/css/chat_friend.css">
		<script src="pinker/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="pinker/js/Template.js"></script>
		<script type="text/javascript" src="pinker/js/personpage.js"></script>
		<script type="text/javascript" src="pinker/js/head_info.js"></script>

		<title></title>



	</head>

	<body>

	<%
		BlogDaoService blog=new BlogDaoServiceImpl();
		pk_user userMy = (pk_user) request.getSession().getAttribute("user");

		Integer id = userMy.getId();
		List<Blog> allBlog = blog.getAllBlog();
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
							<li class="left-status-sate">动态</li>
							<li class="left-status-publish statusActive">发布</li>
							<li class="left-status-attention">收藏与关注</li>
							<li class="left-status-perInfo"><a href="pinker/PersonPage.jsp">个人信息</a></li>
						</ul>
					</div>
					
					<!--个人信息-->

					<!--收藏的博文-->
					<div class="left-attentionBlog">

						<c:forEach items="${usersBlog}" var="blog">
						<div class="blog-wrap">
							<div class="blog-title-wrap">
								<a href="pinker/blog.jsp?blogId=${blog.id}">${blog.title}</a>
							</div>
							<div class="blog-info">
								<span>${blog.publishtime}</span>·
								<%--<span>16 个回答</span>·<span>55 个关注</span>--%>
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
					<%@include file="/WEB-INF/include/person_menu.jsp"%>


					<%@include file="/WEB-INF/include/footer_info.jsp"%>


				</div>
			</div>

		</div>


	<%@include file="/WEB-INF/include/chat_friend.jsp"%>


	</body>

</html>