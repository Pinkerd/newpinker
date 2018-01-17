<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/16
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>密码安全中心-找回密码</title>
</head>
<style>
    *{margin: 0px;padding: 0px}
    .header{
        width: 100%;
        height: 15%;
        background-color:rgb(59,89,153);
    }
    .title{
        width: 150px;
        height: 30px;
        font-size: 30px;
        line-height: 30px;
        text-align: center;
        padding-top:25px ;
        color: white;
        float: left;
        display: inline-block;
    }
    .userName{
        border: 1px red solid;
        width:100px;
        height: 20px;
        line-height: 20px;
        text-align: center;
        float: right;
        margin-top: 30px;
    }
    .userHeader{
        border: 1px red solid;
        width: 60px;
        height: 60px;
        float: right;
        margin-top: 10px;
        margin-right: 100px;
    }
    .byEmail{
        width: 30%;
        height: 30%;
        /*border: solid 1px red;*/
        float: left;
        margin-top: 10%;
        margin-left: 10%;
        background-color:rgb(59,89,153);
    }
    .byQA{
        width: 30%;
        height: 30%;
       /* border: solid 1px red;*/
        float: left;
        margin-top: 10%;
        margin-left: 20%;
        background-color:rgb(59,89,153);
    }
    .innnerTitle{
        width: 200px;
        height: 50px;
        line-height: 50px;
        font-size: 20px;
        text-align: center;
       /* border:  1px solid red;*/
        float: left;
        color: white;
        margin-top:70px;
        margin-left: 20px;
    }
</style>
<body>
    <div class="header">
        <img src="img/安全中心.png"  style="float:left;width: 55px;height: 60px;margin-top: 10px;margin-left: 100px">
        <div class="title">安全中心</div>
    </div>

    <div class="byEmail">
        <img src="img/通过邮件找回.png" style="width: 100px;height: 100px;float: left;margin-top: 45px;margin-left:45px">
        <div class="innnerTitle">通过邮件找回密码</div>
    </div>

    <div class="byQA">
        <img src="img/通过密码提示问题找回.png"  style="width: 100px;height: 80px;float: left;margin-top: 55px;margin-left:30px">
        <div class="innnerTitle">密码提示问题找回密码</div>
    </div>


<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".byEmail").click(function () {
                window.location.href="邮件找回的连接";
            })
            $(".byQA").click(function () {
                window.location.href="密码提示问题找回的页面";
            })
        })



    </script>


</body>

</html>
