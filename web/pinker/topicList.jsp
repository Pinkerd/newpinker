
<%@ page import="java.util.List" %>
<%@ page import="com.pinker.service.TopicService" %>
<%@ page import="com.pinker.entity.pk_topic" %>
<%@ page import="com.pinker.service.Impl.TopicServiceImpl" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp"%><%@ page errorPage="errorPage.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/include/base_info.jsp" %>
		<link rel="stylesheet" type="text/css" href="pinker/css/Template.css"/>
		<link rel="stylesheet" type="text/css" href="pinker/css/topicList.css"/>
		<link rel="stylesheet"  type="text/css" href="pinker/css/head_info.css">
		<script  type="text/javascript" src="pinker/js/head_info.js"></script>
		<script type="text/javascript" src="pinker/js/Template.js"></script>
		<title></title>
	</head>

	<body>



		<!--模板容器-->
		<div class="template-body">
			<!--头部容器-->
			<%@include file="/WEB-INF/include/head_info.jsp"%>


			<!--模板结束-->
			<div class="template-main-body">
				<div class="template-body-left">
					<!--在这里写左边-->
					<div class="template-body-left-1">
						<div class="template-body-left-1-neirong" >
							<%
								TopicService top=new TopicServiceImpl();
								List<pk_topic> list = top.selectAll();
								request.setAttribute("list",list);
							%>
							<c:forEach items="${list}" var="topic">

								<div class="template-body-left-body">
									<div class="content">
										<a href="pinker/topic_blogList.jsp?topicId=${topic.id}" class="item-link" style="background-image: url(http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId=${topic.id});">
										<span class="mask" >
											<span class="name">${topic.title}</span>
										</span>
										</a>
										<div class="visitFBZ">
											发布者 : ${topic.user.username}<br>
												${topic.publishtime}
										</div>
									</div>
								</div>

							</c:forEach>
						</div>
						<!--底部更多按钮-->
						<button class="db">
							<a href="#">更多</a>
						</button>
					</div>
				</div>


				<div class="template-body-right">
					<!--在这里写右边-->
					<div class="template-body-right-1">
						<div class="template-body-right-1-1">
							<div class="template-body-right-1-1-header">
								<h3>功能区</h3>
							</div>
							<div class="template-body-right-1-1-body">
								<ul class="items">
									<li class="item">
										<div class="item-header">
											<a href="http://localhost:8080/pinker/pinker/publishTopic.jsp" class="item-link">
												<img src=""  alt="发 布话 题" class="yt66"/>
											</a>
											<div class="content">
												<a href="http://localhost:8080/pinker/pinker/publishTopic.jsp">发布话题</a>
												<div class="bio">发起一段知识旅程</div>
											</div>
										</div>
									</li>
									<%--<li class="item">--%>
										<%--<div class="item-header">--%>
											<%--<a href="*" class="item-link">--%>
												<%--<img src="品客picture/v2-968dbd9e769da38e4b7229260e4deb99_xs.jpg" alt="世界卫生组织" class="yt66"/>--%>
											<%--</a>--%>
											<%--<div class="content">--%>
												<%--<a href="#">世界卫生组织</a>--%>
												<%--<div class="bio">举办过265场圆桌</div>--%>
											<%--</div>--%>
										<%--</div>--%>
									<%--</li>--%>
									<%--<li class="item">--%>
										<%--<div class="item-header">--%>
											<%--<a href="*" class="item-link">--%>
												<%--<img src="品客picture/v2-3c49f055ec23ee5e9655709cc844783a_xs.jpg" alt="云栖社区" class="yt66"/>--%>
											<%--</a>--%>
											<%--<div class="content">--%>
												<%--<a href="#">云栖社区</a>--%>
												<%--<div class="bio">举办过275场圆桌</div>--%>
											<%--</div>--%>
										<%--</div>--%>
									<%--</li>--%>
									<%--<li class="item">--%>
										<%--<div class="item-header">--%>
											<%--<a href="*" class="item-link">--%>
												<%--<img src="品客picture/v2-f2f28d6025d3d2465a25979a8c2880a8_xs.jpg" alt="宝马中国" class="yt66"/>--%>
											<%--</a>--%>
											<%--<div class="content">--%>
												<%--<a href="#">宝马协会</a>--%>
												<%--<div class="bio">举办过295场圆桌</div>--%>
											<%--</div>--%>
										<%--</div>--%>
									<%--</li>--%>
									<%--<li class="item">--%>
										<%--<div class="item-header">--%>
											<%--<a href="*" class="item-link">--%>
												<%--<img src="品客picture/v2-199ad72f25ead97a5035772b61530c5c_xs.jpg" alt="法大大" class="yt66"/>--%>
											<%--</a>--%>
											<%--<div class="content">--%>
												<%--<a href="#">法大大</a>--%>
												<%--<div class="bio">举办过50场圆桌</div>--%>
											<%--</div>--%>
										<%--</div>--%>
									<%--</li>--%>
									<%--<li class="item">--%>
										<%--<div class="item-header">--%>
											<%--<a href="*" class="item-link">--%>
												<%--<img src="品客picture/v2-3a5304978e7b7f22d935908802193dbb_xs.jpg" alt="银华基金" class="yt66"/>--%>
											<%--</a>--%>
											<%--<div class="content">--%>
												<%--<a href="#">银华基金</a>--%>
												<%--<div class="bio">举办过69场圆桌</div>--%>
											<%--</div>--%>
										<%--</div>--%>
									<%--</li>--%>
									<%--<li class="item">--%>
										<%--<div class="item-header">--%>
											<%--<a href="*" class="item-link">--%>
												<%--<img src="品客picture/v2-4b90d11b2d0cb9c5e584f20629266ade_xs.jpg" alt="安瑞传媒" class="yt66"/>--%>
											<%--</a>--%>
											<%--<div class="content">--%>
												<%--<a href="#">安瑞传媒</a>--%>
												<%--<div class="bio">举办过106场圆桌</div>--%>
											<%--</div>--%>
										<%--</div>--%>
									<%--</li>--%>
									<%--<li class="item">--%>
										<%--<div class="item-header">--%>
											<%--<a href="*" class="item-link">--%>
												<%--<img src="品客picture/v2-5f8391f398c39cdcbe3296c316b79542_xs.jpg" alt="冠军欧洲" class="yt66"/>--%>
											<%--</a>--%>
											<%--<div class="content">--%>
												<%--<a href="#">冠军欧洲(电视栏目)</a>--%>
												<%--<div class="bio">举办过150场圆桌</div>--%>
											<%--</div>--%>
										<%--</div>--%>
									<%--</li>--%>
									<%--<li class="item">--%>
										<%--<div class="item-header">--%>
											<%--<a href="*" class="item-link">--%>
												<%--<img src="品客picture/v2-9d0ca7befbf1f9728568548854069cab_xs.jpg" alt="看电影" class="yt66"/>--%>
											<%--</a>--%>
											<%--<div class="content">--%>
												<%--<a href="#">看电影</a>--%>
												<%--<div class="bio">举办过168场圆桌</div>--%>
											<%--</div>--%>
										<%--</div>--%>
									<%--</li>--%>
									<%--<li class="item">--%>
										<%--<div class="item-header">--%>
											<%--<a href="*" class="item-link">--%>
												<%--<img src="品客picture/v2-eac313ff86265200374a516cf895856d_xs.jpg" alt="璇机" class="yt66"/>--%>
											<%--</a>--%>
											<%--<div class="content">--%>
												<%--<a href="#">璇机</a>--%>
												<%--<div class="bio">举办过199场圆桌</div>--%>
											<%--</div>--%>
										<%--</div>--%>
									<%--</li>--%>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>




	</body>
</html>