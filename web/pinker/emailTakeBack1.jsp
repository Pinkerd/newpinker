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
        width: 300px;
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
        margin: 100px auto;
    /*    background: red;*/
    }
    .errMsg{
        color: red;
        text-align: center;
    }
    #first{ background-color: orange}
    #second{background: dodgerblue}
    #third{background: dodgerblue}
    #fourth{background: dodgerblue}

    .InnerBox{
        width: 400px;
        height: 30px;
        line-height: 30px;
        margin: 100px auto;
        /*background: red;*/
    }
</style>
<body>
    <div class="allStep">
        <div class="step" id="first">一、填写个人邮箱</div>
        <div class="step" id="second">二、前往邮箱验证</div>
        <div class="step" id="third">三、修改密码</div>
        <div class="step" id="fourth">四、修改成功</div>
    </div>
    <div class="fullIn">
       <form action="UsersServlet?method=emailTakeBack" method="post">
           <div class="InnerBox">
               <span>请输入您的邮箱： </span>
               <input type="text" name="email" value="${email}" style="width: 200px;height: 25px">
               <div class="errMsg">${errMsg}</div>
           </div>


            <div  id="nextStep"> <input type="submit" value="下一步" id="goNext" style="width: 100px;height: 30px"></div>
       </form>
    </div>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
      /*  $("#goNext").click(function () {

            var namePatrn = /^[a-z0-9_-]{3,16}$/;
            var name = $("[name=loginName]").val();
            //密码的验证和判断
            if (!namePatrn.test(name)) {
                alert("登录名需要是3~16位的字母数字下划线和横线");
                return false;
            }
        })*/
    })
</script>
</body>
</html>
