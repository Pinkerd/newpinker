<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/Template.css" />
		<link rel="stylesheet" type="text/css" href="css/PersonPage.css" />
		<script src="../pinker/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="../pinker/js/personpage.js"></script>
		<script type="text/javascript" src="js/layer/layer.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
		<title></title>

	</head>

	<body>
		<!--模板容器-->
		<div class="template-body">
			
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
					<div class="left-personInfo">
						<form action="# " method="post">
							<div class="left-infoWrap">
								<h1>个人信息管理</h1>
								<hr />
								<table border="0" cellspacing="10" cellpadding="" class="personInfo-table">
									<tr>
										<td>登录名</td>
										<td><span class="loginName">18260070151</span>
											<a href="#" class="changePassword">修改密码</a>
										</td>
									</tr>
									<tr>
										<td>邮箱</td>
										<td><input type="email" name="left-info-email" id="left-info-email" value="786384149@qq.com" /></td>
									</tr>
									<tr>
										<td>性别</td>
										<td class="sexTd">
											<input type="radio" name="sex" id="sex-male" value="1" checked/><label for="sex-male">&nbsp;男</label>
											<span></span>
											<input type="radio" name="sex" id="sex-female" value="0" /><label for="sex-female">&nbsp;女</label>
										</td>
									</tr>
									<tr>
										<td>性取向</td>
										<td class="oritationTd">
											<input checked type="radio" name="oritation" id="oritation-male" value="1" /><label for="oritation-male">&nbsp;男</label>
											<span></span>
											<input type="radio" name="oritation" id="oritation-female" value="0" /><label for="oritation-female">&nbsp;女</label>
										</td>
									</tr>

									<tr>
										<td>
											个人简介
										</td>
										<td>
											<textarea name="introduce" rows="10" cols="50"></textarea>

										</td>
									</tr>
								</table>

								<input type="submit" value="保存" />
							</div>
						</form>
					</div>

					<!--关注的话题-->
					<div class="left-attentionTopic">
						<div id="topic-wrap">
							
						</div>
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