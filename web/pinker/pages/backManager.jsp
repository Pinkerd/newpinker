<%--
  Created by IntelliJ IDEA.
  User: Aries.gu
  Date: 2017/12/28
  Time: 17:07
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="http://localhost:8080/pinker/pinker/">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>后台管理员系统</title>
    <style>
        *{margin: 0px;padding: 0px}
        .box{
           width: 100%;
            height: 100%;
            margin-top:99px;
            margin-left: 110px;
        }
        .managerleft{
            height: 100%;
            width:230px;
            background-color:rgb(88,88,88);
            position: fixed;
            top:0px;
            border-top: none;
        }
        ul{
            height: 500px;
            width:220px;
            background-color:rgb(88,88,88);
            position: fixed;
            top:50px;
            left: 10px;
        }
        ul li{
            height: 55px;
            z-index: 100;
            background-color:rgb(88,88,88);
            line-height: 55px;
            text-indent: 2em;
            color: white;
        }
        ul li:hover{
            background-color: rgb(58,58,58);
        }

        .managerTop{
            height: 100px;
            width: 100%;
            background-color:rgb(59,89,153);
            position: fixed;
        }
        .toptitle{
            height: 100px;
            width: 130px;
            color: white;
            line-height: 100px;
            font-size: 50px;
            float: left;
            margin-left: 20px; ;
        }
        .toparticle{
            height: 100px;
            width: 300px;
            color: white;
            line-height: 100px;
            font-size: 30px;
            float: left;
            margin-top: 10px;
        }
        .topadmin{
            height: 100px;
            width: 300px;
            color: white;
            line-height: 100px;
            font-size: 30px;
            float: right;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="managerTop">
    <img src="images/logos.jpg" style="margin-left: 250px;width:100px;height: 100px;float: left">
    <div class="toptitle">品客</div>
    <div class="toparticle">后 台 管 理 系 统</div>
    <div class="topadmin">欢迎,${admin.username}</div>
</div>
<iframe  src=""  class="box" id="sframe"></iframe>
<div class="managerleft">
    <ul id="all">
        <li id="white">用户名单</li>
        <li id="black">黑名单</li>
        <li id="tip">帖子列表</li>
        <li id="topic">话题审核</li>
    </ul>
</div>


<script type="text/javascript"  src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">

    $(document).ready(function () {

      $("li[id=white]").click(function () {
            $("#sframe").attr("src", "http://localhost:8080/pinker/UsersServlet?method=findUser")
        })
        $("li[id=black]").click(function () {
            $("#sframe").attr("src", "http://localhost:8080/pinker/UsersServlet?method=blackList")
        })


        $("li[id=tip]").click(function () {
            $("#sframe").attr("src", "第三个网址")
        })
        $("li[id=topic]").click(function () {
            $("#sframe").attr("src", "第四个网址")
        })

    })

</script>
</body>
</html>
