<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/30
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登陆界面</title>
</head>
<Style>
    *{margin: 0px;padding: 0px}
    .toptitle{
        width: 130px;
        color: black;
        font-size: 60px;
        font-weight: bold;
        margin-left: 20px;
        display: inline;
        position: absolute;
        top: 40px;

    }
    .toparticle{
        width: 300px;
        color: black;
        font-size: 35px;
        display: inline;
        position: absolute;
        top: 70px;
        left: 420px;
    }
    .box{
        height: 700px;
        width: 100%;
        background-color:rgb(59,89,153);
    }
    .login{
        width: 500px;
        height:500px;
        float: right;
        background-color:white;
        margin-top: 100px;
        margin-right:100px ;
    }
     #loginInput{
        width: 300px;
        height: 40px;
         font-size: 20px;
         text-indent: 15px;
    }
    #pswInput{
        width: 300px;
        height: 40px;
        font-size: 20px;
        text-indent:15px;

    }
    #subInput{
        width: 160px;
        height: 50px;
        background-color:rgb(59,89,153);
        font-size:20px;
        border-radius: 15px;
        margin-top: 60px;
        margin-left: 170px;
    }
    .loginDiv{
        font-size: 20px;
        width: 400px;
        height: 40px;
        margin-left: 50px;
        margin-top: 100px;
    }
    .pswDiv{
        font-size: 20px;
        width: 400px;
        height: 40px;
        margin-left: 50px;
        margin-top: 60px;
    }
</Style>
<body>
    <div>
        <img src="../images/managerLogo.jpg">
        <div class="toptitle">品客</div>
        <div class="toparticle">后 台 管 理 系 统</div>
    </div>
    <div class="box">
        <div class="login">
            <form action="http://localhost:8080/pinker/UsersServlet?method=ManagerlogIn" method="post">
                <div class="loginDiv">
                     账号&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" name="loginname" id="loginInput">
                </div><br>
                <div class="pswDiv">
                    密码&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="password" name="password" id="pswInput">
                </div><br>
            <input type="submit" value="登陆" id="subInput">
            </form>
        </div>
    </div>
</body>
</html>
