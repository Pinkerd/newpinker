<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/27
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp"%>
<%@include file="/WEB-INF/include/base_info.jsp" %>
<html>
<head>
    <title>修改话题</title>
</head>
<%--<%
    TopicService ts = new TopicServiceImpl();
    String t = request.getParameter("numb");
    Integer a = Integer.valueOf(t);
    pk_topic topic = ts.selectOne(a);
    request.setAttribute("tk",topic);
%>--%>
<body>
<form action = "pkTopicServlet?method=changePkTopic1" method="post">
    <div><input type="text" name="id" value="${list.id}"></div>
    <div><input type="text" name="title" value="${list.title}"></div>
    <div><input type="text" name="content" value="${list.content}"></div>
    <div><input type="text" name="titleimg" value="${list.titleimg}"></div>
    <div><input type="text" name="userid" value="${list.userId}"></div>
    <input type="submit" value="修改">
</form>
</body>
</html>
