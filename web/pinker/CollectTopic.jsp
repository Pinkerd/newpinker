<%@ page import="com.pinker.service.TopicService" %>
<%@ page import="com.pinker.service.serviceimpl.TopicServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pinker.service.ConcernTopicService" %>
<%@ page import="com.pinker.service.Impl.ConcernTopicServiceImpl" %>
<%@ page import="com.pinker.entity.*" %>
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
		<script type="text/javascript" src="pinker/js/Template.js"></script>
		<script type="text/javascript" src="pinker/js/personpage.js"></script>
		<title></title>
	</head>
<%
	ConcernTopicService con=new ConcernTopicServiceImpl();
	pk_user TopMy = (pk_user) request.getSession().getAttribute("user");
	System.out.println(TopMy);
	Integer id = TopMy.getId();
	List<ConcernTopic> collectTopic = con.findConcernTopicByUserId(id);
	request.setAttribute("collectTopic",collectTopic);

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
							<li class="left-status-publish">发布</li>
							<li class="left-status-attention">收藏与关注</li>
							<li class="left-status-perInfo">个人信息</li>
						</ul>
					</div>

					<!--个人信息-->

					<!--关注的话题-->

					<div class="left-attentionTopic">
						<c:forEach items="${collectTopic}" var="collectTop">
							<div class="topic-wrap">
								<div class="topic-img">
									<img src="http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId=${collectTop.topicId}" width="60px" height="60px" />
								</div>
								<div style="width: 400px" class="topic-title">
									<a href="pinker/topic_blogList.jsp?topicId=${collectTop.topicId}"><h3>${collectTop.topic.title}</h3></a>
									<div class="detail-wrap" hidden>
										<div class="detail-img">
											<img src="http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId=${collectTop.topicId}" width="60px" height="60px"/>
										</div>

										<div class="detail-introduce" >
											<span class="detail-span">
											</span>
										</div>

										<div class="detail-buttonwrap">

										</div>
									</div>
								</div>
								<div class="topic-introduce">
										${collectTop.topic.content.substring(0,15)}
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
					<div class="right-menu">
						<ul>
							<!--<div class="menu-personInfo isMenuActive">
								<li>个人资料管理</li>
							</div>-->

							<div class="menu-attentionTopic">
								<li>关注的话题</li>
							</div>

							<div class="menu-attentionBlog">
								<li>收藏的博文</li>
							</div>

							<div class="menu-myTopic">
								<li>发布的话题</li>
							</div>

							<div class="menu-myBlog">
								<li>发布的博文</li>
							</div>

							<!--<div class="menu-friend">
								<li>好友管理</li>
							</div>-->

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
							<div id="friend-manager">

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
							<div id="friend-manager">

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
							<div id="friend-manager">

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