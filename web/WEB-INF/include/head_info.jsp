<%@ page import="com.pinker.entity.Friend" %>
<%@ page import="com.pinker.service.FriendService" %>
<%@ page import="com.pinker.service.Impl.FriendServiceImpl" %>
<%@ page import="com.pinker.entity.pk_user" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: OONE
  Date: 2017/12/31
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--头部容器-->
<div class="template-header">
    <div class="template-header-wrap">
        <span class="template-logo">品客·</span>
        <nav class="template-header-nav">
            <a href="index.jsp" class="template-header-navItem isActive">首页</a>
            <a href="topicList.jsp" class="template-header-navItem">发现</a>
            <a href="topicList.jsp" class="template-header-navItem">话题</a>
        </nav>
        <!--搜索框-->

        <div class="template-search-bar">
            <input type="text" name="" id="" value="" placeholder="你感兴趣的话题。。。" />

        </div>
        <div class="template-search-buttonWrap">
            <input type="button" class="template-search-button" />
        </div>
        <!--右侧登录注册以及头像-->
        <div class="right template-header-right">

            <c:choose>
                <c:when test="${user!=null}">
                    <div class="template-userInfo">
                        <div class="head-img">
                            <a href="pinker/PersonPage.jsp">
                                <span class="head-username">${user.username}</span>
                                <img src="http://localhost:8080/pinker/IOServlet?method=loadHeadImg" height="40px" width="40px" />
                            </a>
                        </div>
                            <input type="hidden" value="${user.id}" id="userId">
                            <%--好友请求框--%>
                            <div class="friendRequest">

                                <%
                                    pk_user user=(pk_user) request.getSession().getAttribute("user");

                                        FriendService friendService=new FriendServiceImpl();
                                        List<Friend> friList=friendService.getAllFriByUserIdAndStatue(user.getId(),0);
                                        request.setAttribute("friList",friList);

                                    List<Friend> trueFri=friendService.getAllFriByUserIdAndStatue(user.getId(),1);
                                        request.setAttribute("trueFri",trueFri);
                                %>
                                <%--<img src="pinker/img/朋友.png" height="30px" width="30px" >--%>
                                <div class="friendRequestwrap-box">
                                    <table class="friendRequestwrap-table">
                                        <c:forEach items="${friList}" var="fri">
                                            <tr>
                                                  <td>  ${fri.friend.username}</td>
                                                <td>    <button onclick="receive(${fri.friend.id},$(this))">接受</button></td>
                                            </tr>
                                        </c:forEach>
                                    </table>

                                </div>
                            </div>


                    </div>
                </c:when>

                <c:otherwise>
                    <div class="template-loginRegist">
                        <a href="pinker/login.jsp">登录</a>
                        <%--<a href="pinker/login.jsp">注册</a>--%>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>