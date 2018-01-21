
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
		<link rel="stylesheet" type="text/css" href="pinker/css/turlin.css">
		<script  type="text/javascript" src="pinker/js/head_info.js"></script>
		<script type="text/javascript" src="pinker/js/Template.js"></script>
		<script type="text/javascript" src="pinker/js/turlin.js"></script>
		<script type="text/javascript" src="pinker/js/topic.js"></script>
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
							<%--<%
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

							</c:forEach>--%>
						</div>
						<!--底部更多按钮-->
						<button class="db">
							<a href="javascript:void(0)">更多</a>
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

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>


		<%@include file="/WEB-INF/include/turlin.jsp"%>



	</body>
</html>