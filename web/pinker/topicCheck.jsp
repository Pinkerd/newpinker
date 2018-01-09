<%@ page import="com.pinker.service.TopicService" %>
<%@ page import="com.pinker.service.Impl.TopicServiceImpl" %>
<%@ page import="com.pinker.entity.pk_topic" %>
<%@ page import="com.pinker.entity.Page" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/9 0009
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/include/base_info.jsp" %>
    <title>Title</title>
</head>
<body>
<h1 align="center">话题审核</h1>

<%
    int pageNum= Integer.parseInt(request.getParameter("pageNum"));
    TopicService topicService=new TopicServiceImpl();
    Page<pk_topic> topicPage =new Page<>();
    topicPage.setPageSize(5);
    topicPage.setPageNumber(pageNum);
    topicPage=topicService.findTopicByStatus(1,topicPage);
    request.setAttribute("topicPage",topicPage);
%>
<table align="center" border="1" cellspacing="0" class="topicChecktable" width="900px" >
    <tr>
        <td style="width: 80px;text-align: center">id</td>
        <td>话题图</td>
        <td>标题</td>
        <td>内容</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${topicPage.data}" var="topic">
    <tr>
        <td style="width: 80px;text-align: center">${topic.id}</td>
        <td><img src="IOServlet?method=loadTopicImg&topicId=${topic.id}" height="100px" width="100px"></td>
        <td>${topic.title}</td>
        <td style="width: 400px">${topic.content}</td>
        <td style="text-align: center">
            <button onclick="pass(${topic.id},this)">通过</button>
            <button onclick="noPass(${topic.id},this)">不通过</button>
        </td>
    </tr>
    </c:forEach>
</table>

<div class="pageNumberbox" style="width: 200px;margin: 20px auto;">
<c:if test="${topicPage.pageNumber>1}">
    <a href="pinker/topicCheck.jsp?pageNum=${topicPage.pageNumber-1}">[上一页]</a>
</c:if>
    <c:forEach begin="1" end="${topicPage.totalPage}" var="index">
    <c:choose>
        <c:when test="${topicPage.pageNumber==index}">
           <span style="color: red">[${index}]</span>
        </c:when>
        <c:otherwise>
            <a href="pinker/topicCheck.jsp?pageNum=${index}">[${index}]</a>
        </c:otherwise>
    </c:choose>
    </c:forEach>
    <c:if test="${topicPage.pageNumber<topicPage.totalPage}">
    <a href="pinker/topicCheck.jsp?pageNum=${topicPage.pageNumber+1}">[下一页]</a>
    </c:if>
</div>

<script  type="text/javascript">
    function pass(topicId,button) {
        $.post("pkTopicServlet?method=topicCheck",{topicId:topicId,check:"yes"},function (result) {
            if(result=="1"){
            $(button).parents("tr").css("background","green");
            }
        })
    }

    function noPass(topicId,button) {
        $.post("pkTopicServlet?method=topicCheck",{topicId:topicId,check:"no"},function (result) {
            if(result=="1"){
                $(button).parents("tr").css("background","red");
            }
        })
    }
    
    
</script>

</body>
</html>
