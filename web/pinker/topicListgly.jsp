<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  pk_user: Administrator
  Date: 2017/12/26
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/include/base_info.jsp" %>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<html>
<head>
    <title>话题列表</title>
    <style>
        .searchByid{
            display: inline-block;
        }
        .searchByTopic{
            display: inline-block;
        }
        .glyImg{
            height: 150px;
            width: 150px;
        }

        .contentTd{
            width: 400px;
        }

        .tl{

            text-align:center;
            position: relative;
            margin-top: 70px;
        }

        .czxx{
            width: 180px;
        }

        .lgssk{
            position:absolute;
            margin-left: 1350px;
        }
    </style>
</head>
<body>
    <h1 align="center" font-weight:strong; style="background-color: #0F88EB">话题后台管理</h1>
    <div class="lgssk">
    <form action="pkTopicServlet?method=selectById" method="post" class="searchByid">
       <span class="ssid">
         <input type = "text" class="idssk" placeholder="按id搜索话题" name="id">
         <input type="submit" value="搜索">
       </span>
    </form>&nbsp;&nbsp;&nbsp;
    <form action="pkTopicServlet?method=findByUserId" method="post" class="searchByTopic">
    <span class="ssid">
        <input type = "text" class="uidssk" placeholder="按userid搜索话题" name="uid">
        <input type="submit" value="搜索">
    </span></form>
    </div>
<div class = "tlall">
    <table class="tl" border="1px" align="center">
        <tr>
            <th>话题id</th>
            <th>标题</th>
            <th>内容</th>
            <th>图片路径</th>
            <th>用户id</th>
            <th>发表时间</th>
            <th>操作</th>
        </tr>
        <C:forEach items="${list}" var="abc">
        <tr>
            <td>${abc.id}</td>
            <td>${abc.title}</td>
            <td class="contentTd">${abc.content}</td>
            <td><img src=${abc.titleimg} class="glyImg"></td>
            <td>${abc.userId}</td>
            <td>${abc.publishtime}</td>
            <td colspan= 3 class="czxx">
              <a href="pkTopicServlet?method=selectOne&numb=${abc.id}" class="tlhtxq">查看话题详情</a>
              <a href="pkTopicServlet?method=changePkTopic&numb=${abc.id}" class="tlhtxg">修改话题</a>
              <a href="#" class="tlscht" onclick="window.confirm('确定要删除吗')?this.href='pkTopicServlet?method=deletePkTopic&numb=${abc.id}':this.href='javascrpt:void()';">删除话题</a>
            </td>
        </tr></C:forEach>
    </table>
</div>
</body>
</html>
