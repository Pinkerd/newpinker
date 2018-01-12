<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
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

        .searchById{
            display: inline-block;
            margin: 30px;
            border: solid 1px black;
        }
        .searchByTopic{
            display: inline-block;
            margin: 30px;
            border: solid 1px black;
        }
        .searchByTitle{
            display: inline-block;
            margin: 30px;
            border: solid 1px black;
        }
        .glyImg{
            height: 150px;
            width: 150px;
        }

        .htAll{
            margin-top: 60px;
           /* border: 1px solid red;*/
            position: relative;
        }

        .contentTd{
            width: 400px;
        }

        .tl{
            text-align:center;
            /*position: absolute;*/
            margin-top: 10px;
           /* margin-left: 200px;*/
        }

        .czxx{
            width: 180px;
        }

        .ssid{
              padding-left: 50px;
              position:absolute;
              /*margin-left: 50%;*/
              margin-top: 2%;
          }

        .ssid1{
            position:absolute;
           /* margin-left: 65%;*/
            margin-top: 2%;
        }

        .ssid2{
            position:absolute;
            margin-top: 2%;
          /*  padding-left: 550px;*/
        }

        .ymxs{
            /*border:1px solid black;*/
            margin: 55px auto;
        }

        .sgk{
            /*border:3px solid orangered;*/
            width: 900px;
            margin:0PX auto;
        }
    </style>
</head>
<body>
   <div class="htAll">

        <div class="sgk">
             <form action="pkTopicServlet?method=selectOne" method="post" class="searchById">
                 <input type = "text" class="idssk" placeholder="按id搜索话题" name="numb">
                 <input type="submit" value="搜索">
             </form>

             <form action="pkTopicServlet?method=findByUserId" method="post" class="searchByTopic">
                <input type = "text" class="uidssk" placeholder="按userid搜索话题" name="uid">
                <input type="submit" value="搜索">
            </form>

             <form action="pkTopicServlet?method=mhFind" method="post" class="searchByTitle">
                    <input type = "text" class="mhcxssk" placeholder="按标题搜索话题" name="htbt">
                    <input type="submit" value="搜索">
            </form>
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
            </tr>  <c:forEach items="${page6.data}" var="abc">
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
            </tr></c:forEach>
        </table>
        <div class="ymxs" align="center">
            <a href="pkTopicServlet?method=findBook&pn=1">首页</a>
            <a href="pkTopicServlet?method=findBook&pn=${page6.pageNumber-1}">上一页</a>
            <c:forEach begin="1" end="${page6.totalPage}" var="fylb">
                <c:choose>
                    <c:when test="${fylb==page6.pageNumber}">
                        [${fylb}]
                    </c:when>
                <c:otherwise>
                    <a href="pkTopicServlet?method=findBook&pn=${fylb}">${fylb}</a>
                </c:otherwise>
                </c:choose>
            </c:forEach>
            <a href="pkTopicServlet?method=findBook&pn=${page6.pageNumber+1}">下一页</a>
            <a href="pkTopicServlet?method=findBook&pn=${page6.totalPage}">末页</a>
            <span>第${page6.pageNumber}页</span>&nbsp;&nbsp;
            <span>共${page6.totalPage}页</span>&nbsp;&nbsp;
            <span>${page6.totalRecord}个话题</span>&nbsp;&nbsp;
        </div>
    </div>

    </div>
</body>
</html>
