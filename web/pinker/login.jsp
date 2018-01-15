<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>	
		<%@include file="/WEB-INF/include/base_info.jsp"%>
		<link rel="stylesheet" type="text/css" href="pinker/css/login.css" />
		<script type="text/javascript" src="pinker/js/jquery-1.7.2.js"></script>
		<style>
			input[type="password"]{
			width: 280px;
			height: 28px;
			font-size: 16px;
			border: 0px;
			padding: 10px;
			display: block;
			margin-top:5px ;
			border-radius:5px ;
			opacity: 0.6;
			background: rgba(250,250,250,0.7);
		}
			#pswTakeBack{
				margin:10px auto 0px;
				font-size: 10px;
				display: inline-block;
				float: right;
				color: #003b81;
			}
		</style>

		<script type="text/javascript">

			$(function () {

                $("input").keypress(function () {
                    if(event.keyCode==32){
                        event.returnValue==false;
                    }
                })
            })

		</script>

	</head>
	<body>
		<div class="index-main">
			<div class="index-main-body">
				<div class="index-header">
					<h1>SaO</h1>
					<h3>知识从未如此性感</h3>
				</div>
				<div class="index-main-login">
					<div class="index-nav">
						<a  class="index-login active" >登录</a>
						<a  class="index-register">注册</a>
						<span id="index-slider" class="toleft"></span>
					</div>
				</div>

				<div class="form-body">
					<div class="index-form-login  isActive" hidden="hidden">

			<%--登陆form表单--%>
					<form action="http://localhost:8080/pinker/UsersServlet?method=logIn" method="post">
						<div class="login-input-usernameWrap">
						<input type="text" name="loginname" value="" placeholder="用户名" onkeyup="this.value=this.value.replace(/[, ]/g,'')"/>
						</div>
						<div id="login-input-passwordWrap">
						<input type="password" name="password"  value="" placeholder="密码" onkeyup="this.value=this.value.replace(/[, ]/g,'')"/>
						</div>
						<div id="LoginErrorMsg">${LoginErrorMsg}</div>
						<div>
							<a href="pinker/pswTakeBack1.jsp" id="pswTakeBack">
								忘记密码了？找回密码
							</a>
						</div>
						<input type="submit" id="login-commitBtn" value="登录"/>
					</form>
					</div>
			<%--注册form表单--%>
					<div class="index-form-regiser" hidden="hidden">
						<form action="http://localhost:8080/pinker/UsersServlet?method=saveUser" method="post" id="#rgform" >
							<input type="text" name="loginName"  id="rgname" placeholder="用户名" value="" onkeyup="this.value=this.value.replace(/[, ]/g,'')"/>
							<input type="password" name="password"  id="rgpsw1" placeholder="密码" value="" onkeyup="this.value=this.value.replace(/[, ]/g,'')" />
							<input type="password" name="passwordAg"  id="rgpsw2" placeholder="确认密码" value="" onkeyup="this.value=this.value.replace(/[, ]/g,'')" />
							<div id="RegErrorMsg">${RegErrorMsg}</div>
							<input type="submit" id="index-register-commit" value="注册"/>
						</form>
					</div>
				</div>
			</div>
		</div>
		<iframe src="pinker/background.jsp" width="100%" height="100%"></iframe>

	</body>
	<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
        $(function(){
            <c:if test="${RegErrorMsg!=null}">
				$(".index-register").trigger("click");

			</c:if>

            $(".index-register").click(function(){
                $("#index-slider").removeClass("toleft");
                $("#index-slider").addClass("toright");

                $(".index-form-login").removeClass("isActive");
                $(".index-form-regiser").addClass("isActive");

                $(".index-register").addClass("active");
                $(".index-login").removeClass("active");
            })

            $(".index-login").click(function(){
                $("#index-slider").removeClass("toright");
                $("#index-slider").addClass("toleft");

                $(".index-form-login").addClass("isActive");
                $(".index-form-regiser").removeClass("isActive");

                $(".index-register").removeClass("active");
                $(".index-login").addClass("active");
            })




            <c:if test="${RegErrorMsg!=null}">
            $(".index-register").trigger("click");

            </c:if>
			/*正则表单验证*/
            $("#index-register-commit").click(function () {
                var name = $("[id=rgname]").val();
                var psw1 = $("[id=rgpsw1]").val();
                var psw2 = $("[id=rgpsw2]").val();
                var namePatrn = /^[a-z0-9_-]{3,16}$/; //校验登录名：只能输入4-20个以字母开头、可带数字、“_”、“.”的字串
                var pswPatrn = /^[a-zA-Z0-9_-]{6,18}$/;  //校验密码：只能输入6-20个字母、数字、下划线
                //用户名的判断
                if (!namePatrn.test(name)) {
                    alert("用户名需要时3到19位的小写字母数字下划线和横线");
                    return false;
                }
                //密码的验证和判断
                if (!pswPatrn.test(psw1)) {
                    alert("密码需要是6~20位的字母数字下划线和横线");
                    return false;
                }
                //确认密码的判断
                if (psw1 != psw2) {
                    alert("两次密码输入的不一致");
                    return false;
                }
            })

        })
	</script>
</html>
