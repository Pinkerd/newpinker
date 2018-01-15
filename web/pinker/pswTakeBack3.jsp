<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/11
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp"%>
<html>
<head>
    <title>密码找回页面</title>
    <%@include file="/WEB-INF/include/base_info.jsp"%>
</head>
<style>
    *{margin: 0px;padding: 0px}
    .step{
        width: 400px;
        height: 50px;
        line-height:50px;
        font-size: 20px;
        text-align: center;
        display: inline-block;
    }
    .allStep{
        width: 1250px;
        height: 50px;
        text-align: center;
        margin: 50px auto;
    }
    .fullIn{
        width: 800px;
        height: 400px;
        border: 1px solid black;
        margin: 50px auto;

    }
    #nextStep{
        width: 100px;
        height: 30px;
        margin: 30px auto;
        /*    background: red;*/
    }
    .errMsg{
        color: red;
        text-align: center;
    }
    #first{ background-color:dodgerblue }
    #second{background:orange }
    #third{background: dodgerblue}
    .InnerBox{
        width: 300px;
        height: 30px;
        line-height: 30px;
        margin: 20px auto;
        /* background: red;*/
    }
</style>
<body>
<div class="allStep">
    <div class="step" id="first">一、填写登录账号</div>
    <div class="step" id="second">二、密码提示问题验证</div>
    <div class="step" id="third">三、修改密码</div>

</div>
<div class="fullIn">
    <form action="UsersServlet?method=updatePassword" method="post">

        <input type="text"  name="id" value="${user.id}" style="display:none">


        <div class="InnerBox" style="display: none;">
            <span>旧密码&nbsp;&nbsp;&nbsp;： </span>

            <input type="password" class="oldPassword" name="oldPassword" id="oldPassword"  value="${user.password}" style="width: 200px;height: 25px">
        </div>
        <div class="InnerBox">
            <span>新密码&nbsp;&nbsp;&nbsp;： </span>
            <input type="password" class="newPassword" name="newPassword" id="newPassword" style="width: 200px;height: 25px">
        </div>
        <div class="InnerBox">
            <span>重复密码： </span>
            <input type="password" class="newPassword" name="newPasswordAg" id="newPasswordAg" style="width: 200px;height: 25px">
        </div>


        <div  id="nextStep"> <input type="submit" value="下一步" id="goNext" style="width: 100px;height: 30px"></div>
    </form>
</div>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#goNext").click(function () {

            /*密码表单验证*/
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
</body>
</html>
