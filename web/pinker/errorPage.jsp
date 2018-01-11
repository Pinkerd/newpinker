<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/11
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误页面</title>
    <style>
        *{margin: 0px;padding: 0px;}
        body{
            background: url("img/404.jpg")   no-repeat ;
            background-size:100% auto ;
        }
        .title{
            color: white;
            width: 1300px;
            height: 100px;
            line-height: 100px;
            font-size: 30px;
            text-align: center;
            margin: 100px auto;
        }
        .back{
            width: 150px;
            line-height: 50px;
            height: 50px;
            background-color: #0f88eb;
            margin: 330px auto 0px;
            text-align: center;
            border-radius: 25px;
        }
        .back a{
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="title">
        页面被外星人劫持，程序员正在努力寻找~~~
    </div>
    <div class="back">
        <a href="../index.jsp">返回主页</a>
    </div>
</body>
</html>
