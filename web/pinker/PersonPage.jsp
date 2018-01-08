<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/include/base_info.jsp"%>
		<link rel="stylesheet" type="text/css" href="pinker/css/Template.css" />
		<link rel="stylesheet" type="text/css" href="pinker/css/PersonPage.css" />
        <link rel="stylesheet" type="text/css" href="pinker/css/head_info.css">
		<script type="text/javascript" src="pinker/js/personpage.js"></script>
		<script type="text/javascript" src="pinker/js/head_info.js"></script>
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
							<li class="left-status-sate">动态</li>
							<li class="left-status-publish">发布</li>
							<li class="left-status-attention">收藏与关注</li>
							<li class="left-status-perInfo statusActive">个人信息</li>
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
										<td><span class="loginName">${user.loginName}</span>
											<a href="#" class="changePassword">修改密码</a>
										</td>
									</tr>
									<tr>
										<td>
											用户名
										</td>
										<td>
											<input type="text" name="username" rows="10" cols="50" value="${user.username}">
										</td>
									</tr>

									<tr>
										<td>邮箱</td>
										<td><input type="email" name="left-info-email" id="left-info-email" value="${user.email}" /></td>
									</tr>
									<tr>
										<td>性别</td>

										<td class="sexTd">
											<input type="radio" name="gender" id="sex-male" value="男"
											<c:if test="${user.gender=='男'}">
													checked
											</c:if>
											/><label for="sex-male">&nbsp;男</label>
											<span></span>
											<input type="radio" name="gender" id="sex-female" value="女"
													<c:if test="${user.gender=='女'}">
														checked
													</c:if>
											/><label for="sex-female">&nbsp;女</label>
										</td>
									</tr>
									<%--<tr>--%>
										<%--<td>性取向</td>--%>
										<%--<td class="oritationTd">--%>
											<%--<input checked type="radio" name="oritation" id="oritation-male" value="1" /><label for="oritation-male">&nbsp;男</label>--%>
											<%--<span></span>--%>
											<%--<input type="radio" name="oritation" id="oritation-female" value="0" /><label for="oritation-female">&nbsp;女</label>--%>
										<%--</td>--%>
									<%--</tr>--%>


									<tr>
										<td>
											学校
										</td>
										<td>
											<input type="text" name="school" rows="10" cols="50" value="${user.school}">
										</td>
									</tr>

									<tr>
										<td>
											住址
										</td>
										<td>
											<input type="text" name="residence" rows="10" cols="50" value="${user.residence}">
										</td>
									</tr>
									<tr>
										<td>
											个人简介
										</td>
										<td>
											<textarea name="introduction" class="personIntroduction-textarea" rows="10" cols="50">${user.introduction}</textarea>
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
					<%@include file="/WEB-INF/include/person_menu.jsp"%>

					<%@include file="/WEB-INF/include/footer_info.jsp"%>

				</div>
			</div>

		</div>

	<div id="changePassword-box">

		<h3>修改密码</h3>
		<hr>
		<table align="center">
			<tr>
				<td>
					原密码
				</td>
				<td>
					<input type="password" class="oldPassword">
				</td>
			</tr>

			<tr>
				<td>
					新密码
				</td>
				<td>
					<input type="password" class="oldPassword">
				</td>
			</tr>

			<tr>
				<td>
					重复密码
				</td>
				<td>
					<input type="password" class="oldPassword">
				</td>
			</tr>
		</table>
		<button class="changePasswordBtn">修改密码</button>
		<button class="changePasswordCancelBtn">取消</button>
	</div>



	</body>

</html>