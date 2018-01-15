<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/27
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp"%><%@ page errorPage="errorPage.jsp"%>
<%@include file="/WEB-INF/include/base_info.jsp" %>
<html>
<head>
    <title>话题详情</title>
</head>
<body>
        <table class="htxqGl" border="1px solid" width="1300px"; align="center" style="text-align: center;">
            <tr>
                <td colspan="5" style="font-size: 30px; font-weight: bold;" >话题详情</td>
            </tr>
            <tr>
                <td>话题图片</td>
                <td>话题名称</td>
                <td>话题内容</td>
                <td>发布者</td>
                <td>发布时间</td>
            </tr>
            <c:forEach items="${topic}" var="topicDetail">
            <tr>
                <td> <img src="http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId=${topicDetail.id}" class="tdtp1" width="180px" height="180px"> </td>
                <td>${topicDetail.title}</td>
                <td>${topicDetail.content}</td>
                <td>发布者:${topicDetail.id}</td>
                <td>发布时间:${topicDetail.publishtime}</td>
            </tr>
            </c:forEach>
        </table>
   <div class="glfhzy"> <a href = "http://localhost:8080/pinker/pkTopicServlet?method=findBook&pn=1">返回主页</a></div>
</body>
</html>


