<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<form action="UsersServlet?method=updateUser" method="post">
							<div class="left-infoWrap">
								<h1>个人信息管理</h1>
								<hr />
								<table border="0" cellspacing="10" cellpadding="" class="personInfo-table">

									<tr>
										<td>登录名</td>
										<td><span class="loginName" name="loginName">${user.loginName}</span>
											<input type="text" name="password" style="display: none" value="${user.password}">
										</td>
									</tr>

									<tr style="display: none">
										<td><input type="text" name="id"        		value="${user.id}"></td>
										<td><input type="text" name="password"  	value="${user.password}"></td>
										<td><input type="text" name="status"  		value="${user.status}"></td>
										<td><input type="text" name="roleId" 		value="${user.roleId}"></td>
										<td><input type="text" name="createtime" 	value="${user.createtime}"></td>
										<td><input type="text" name="lastlogin"  	value="${user.lastlogin}"></td>
										<td><input type="text" name="header"  	value="${user.header}"></td>
									</tr>

									<tr>
										<td>用户名</td>
										<td>
											<input type="text" name="username" rows="10" cols="50" value="${user.username}" style="font-size: 15px">
										</td>
									</tr>

									<tr>
										<td>邮箱</td>
										<td><input type="email" name="email" id="left-info-email" value="${user.email}"  style="font-size: 15px" /></td>
									</tr>


									<tr>
										<td>生日</td>
										<td><input type="date" name="birthday" value="${user.birthday}" style="width: 250px;height: 30px" ></td>
									</tr>
									<tr>
										<td>星座</td>
										<td>
											<select name="constellation" style="width: 250px;height: 30px" >
												<option value="${user.constellation}">${user.constellation}</option>
												<option value="白羊座">白羊座</option>
												<option value="金牛座">金牛座</option>
												<option value="双子座">双子座</option>
												<option value="巨蟹座">巨蟹座</option>
												<option value="狮子座">狮子座</option>
												<option value="处女座">处女座</option>
												<option value="天秤座">天秤座</option>
												<option value="摩羯座">摩羯座</option>
												<option value="天蝎座">天蝎座</option>
												<option value="射手座">射手座</option>
												<option value="水瓶座">水瓶座</option>
												<option value="双鱼座">双鱼座</option>
											</select>
										</td>
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


									<tr>
										<td>学校</td>
										<td>
											<input type="text" name="school" rows="10" cols="50" value="${user.school}"  style="font-size: 15px">
										</td>
									</tr>

									<tr>
										<td>住址</td>
										<td>
											<input type="text" name="residence" rows="10" cols="50" value="${user.residence}"  style="font-size: 15px">
										</td>
									</tr>


									<tr>
										<td>
											个人简介
										</td>
										<td>
											<textarea name="introduction" class="personIntroduction-textarea" rows="10" cols="50"  style="font-size: 15px">${user.introduction}</textarea>
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



	</body>




</html>