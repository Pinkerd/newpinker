<%@ page import="com.pinker.service.TopicService" %>
<%@ page import="com.pinker.service.serviceimpl.TopicServiceImpl" %>
<%@ page import="com.pinker.entity.pk_topic" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pinker.entity.pk_user" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/include/base_info.jsp"%>
		<link rel="stylesheet" type="text/css" href="pinker/css/Template.css" />
		<link rel="stylesheet" type="text/css" href="pinker/css/PersonPage.css" />
		<link rel="stylesheet" type="text/css" href="pinker/css/MyTopic.css" />
		<link rel="stylesheet" type="text/css" href="pinker/css/MyTopic1.css" />
		<link rel="stylesheet" type="text/css" href="pinker/css/head_info.css" />
		<script type="text/javascript" src="pinker/js/Template.js"></script>
		<script type="text/javascript" src="pinker/js/personpage.js"></script>
		<script type="text/javascript" src="pinker/js/head_info.js"></script>
		<title></title>
	</head>
<%
	TopicService top=new TopicServiceImpl();
	pk_user TopMy = (pk_user) request.getSession().getAttribute("user");
	System.out.println(TopMy);
	Integer id = TopMy.getId();
	List<pk_topic> userTopic = top.findByUserId(id);
	System.out.println(userTopic);
	request.setAttribute("userTopic",userTopic);
%>
	<body>
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
							<li class="left-status-publish statusActive">发布</li>
							<li class="left-status-attention">收藏与关注</li>
							<li class="left-status-perInfo">个人信息</li>
						</ul>
					</div>

					<!--个人信息-->

					<!--关注的话题-->

					<div class="left-attentionTopic">
						<c:forEach items="${userTopic}" var="topic">
							<div class="topic-wrap">
								<div class="topic-img">
									<img src="http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId=${topic.id}" width="60px" height="60px" />
								</div>
								<div style="width: 400px" class="topic-title">
									<a href="pinker/topic_blogList.jsp?topicId=${topic.id}"><h3>${topic.title}</h3></a>
									<div class="detail-wrap" hidden>
										<div class="detail-img">
											<img src="http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId=${topic.id}" width="60px" height="60px"/>
										</div>

										<div class="detail-introduce" >
											<span class="detail-span">
													${topic.content.substring(0,50)}
											</span>
										</div>

										<div class="detail-buttonwrap">

										</div>
									</div>
								</div>
								<div class="topic-introduce">
										${topic.content.substring(0,15)}
								</div>
							</div>
						</c:forEach>

					</div>





					<!--收藏的博文-->
					<div class="left-attentionBlog">

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

	</body>

</html>