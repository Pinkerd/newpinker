<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
										<td><span class="loginName">${user.loginName}</span>
											<input type="text" name="loginName" style="display: none" value="${user.password}">
											<a class="changePassword" id="changePassword">修改密码</a>
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
										<td>提示问题1</td>
										<td>
											<select name="pswQ1" style="width: 250px;height: 30px;text-align: center" value="${user.pswQ1}">
												<option value="${user.pswQ1}">${user.pswQ1}</option>
												<option value="你父亲的姓名">你父亲的姓名</option>
												<option value="你父亲的职业">你父亲的职业</option>
												<option value="你父亲的生日">你父亲的生日</option>
												<option value="你母亲的姓名">你母亲的姓名</option>
												<option value="你母亲的职业">你母亲的职业</option>
												<option value="你母亲的生日">你母亲的生日</option>
												<option value="你配偶的姓名">你配偶的姓名</option>
												<option value="你配偶的职业">你配偶的职业</option>
												<option value="你配偶的生日">你配偶的生日</option>
												<option value="你的出生地">你的出生地</option>
												<option value="你学号(工号)">你学号(工号)</option>
												<option value="小学班主任名字">小学班主任名字</option>
												<option value="初中班主任名字">初中班主任名字</option>
												<option value="高中班主任名字">高中班主任名字</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>答案1</td>
										<td><input type="text" name="pswA1" rows="10" cols="50" value="${user.pswA1}"  style="font-size: 15px"></td>
									</tr>

									<tr>
										<td>提示问题2</td>
										<td>
											<select name="pswQ2" style="width: 250px;height: 30px;text-align: center">
												<option value="${user.pswQ2}">${user.pswQ2}</option>
												<option value="你父亲的姓名">你父亲的姓名</option>
												<option value="你父亲的职业">你父亲的职业</option>
												<option value="你父亲的生日">你父亲的生日</option>
												<option value="你母亲的姓名">你母亲的姓名</option>
												<option value="你母亲的职业">你母亲的职业</option>
												<option value="你母亲的生日">你母亲的生日</option>
												<option value="你配偶的姓名">你配偶的姓名</option>
												<option value="你配偶的职业">你配偶的职业</option>
												<option value="你配偶的生日">你配偶的生日</option>
												<option value="你的出生地">你的出生地</option>
												<option value="你学号(工号)">你学号(工号)</option>
												<option value="小学班主任名字">小学班主任名字</option>
												<option value="初中班主任名字">初中班主任名字</option>
												<option value="高中班主任名字">高中班主任名字</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>答案2</td>
										<td><input type="text" name="pswA2" rows="10" cols="50"  value="${user.pswA2}"  style="font-size: 15px"></td>
									</tr>

									<tr>
										<td>提示问题3</td>
										<td>
											<select name="pswQ3" style="width: 250px;height: 30px;text-align: center">
												<option value="${user.pswQ3}">${user.pswQ3}</option>
												<option value="你父亲的姓名">你父亲的姓名</option>
												<option value="你父亲的职业">你父亲的职业</option>
												<option value="你父亲的生日">你父亲的生日</option>
												<option value="你母亲的姓名">你母亲的姓名</option>
												<option value="你母亲的职业">你母亲的职业</option>
												<option value="你母亲的生日">你母亲的生日</option>
												<option value="你配偶的姓名">你配偶的姓名</option>
												<option value="你配偶的职业">你配偶的职业</option>
												<option value="你配偶的生日">你配偶的生日</option>
												<option value="你的出生地">你的出生地</option>
												<option value="你学号(工号)">你学号(工号)</option>
												<option value="小学班主任名字">小学班主任名字</option>
												<option value="初中班主任名字">初中班主任名字</option>
												<option value="高中班主任名字">高中班主任名字</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>答案3</td>
										<td><input type="text" name="pswA3" rows="10" cols="50"  value="${user.pswA3}"  style="font-size: 15px"></td>
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

	<div id="changePassword-box">
		<form action="UsersServlet?method=updatePassword" method="post">
		<h3>修改密码</h3>
		<hr>
		<table align="center">
			<input type="text" name="id" value="${user.id}" style="display: none" />
			<tr>
				<td>原密码</td>
				<td><input type="password" class="oldPassword" name="oldPassword" id="oldPassword"></td>
			</tr>

			<tr>
				<td>新密码</td>
				<td><input type="password" class="newPassword" name="newPassword" id="newPassword"></td>
			</tr>

			<tr>
				<td>重复密码</td>
				<td><input type="password" class="newPassword" name="newPasswordAg" id="newPasswordAg"></td>
			</tr>
		</table>
		<input type="submit" class="changePasswordBtn" id="changePasswordBtn" value="修改">
		<input type="button"  class="changePasswordCancelBtn" id="cancelChange" value="取消">
		</form>
	</div>

	</body>

<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$("#changePassword").click(function () {
			$("#changePassword-box").toggle();
        })
		$("#cancelChange").click(function () {
            $("#changePassword-box").toggle();
        })
		/*密码表单验证*/
        $("#changePasswordBtn").click(function () {
            var oldPsw=$("#oldPassword").val();
           var psw="${user.password}";
		  var psw1 = $("[id=newPassword]").val();
		   var psw2 = $("[id=newPasswordAg]").val();
		   var pswPatrn = /^[a-zA-Z0-9_-]{6,18}$/;  //校验密码：只能输入6-20个字母、数字、下划线
		   //密码的验证和判断
		   if (!pswPatrn.test(psw1)) {
			   alert("密码需要是6~20位的字母数字下划线和横线！");
			   return false;
		   }
		   //确认密码的判断
            if(oldPsw!=psw){
                alert("旧密码输入错误！")
            }
		   if (psw1 != psw2) {
			   alert("两次密码输入的不一致！");
			   return false;
		   }
            if (psw1== psw) {
                alert("新密码不能与旧密码一致！");
                return false;
            }
            if (psw2== psw) {
                alert("新密码不能与旧密码一致！");
                return false;
            }

        })

    })
</script>


</html>