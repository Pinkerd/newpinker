<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/27
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <tr>
                <td> <img src="${abc.titleimg}" class="tdtp1" width="180px" height="180px"> </td>
                <td>${abc.title}</td>
                <td>${abc.content}</td>
                <td>发布者:${abc.id}</td>
                <td>发布时间:${abc.publishtime}</td>
            </tr>
        </table>
   <div class="glfhzy"> <a href = "http://localhost:8080/zhwz1/pkTopicServlet?method=showAll">返回主页</a></div>
</body>
</html>


