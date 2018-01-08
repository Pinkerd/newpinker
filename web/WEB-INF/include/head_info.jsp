<%@ page import="com.pinker.entity.Friend" %>
<%@ page import="com.pinker.service.FriendService" %>
<%@ page import="com.pinker.service.Impl.FriendServiceImpl" %>
<%@ page import="com.pinker.entity.pk_user" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  pk_user: OONE
  Date: 2017/12/31
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--头部容器-->
<div class="template-header">
    <div class="template-header-wrap">
        <span class="template-logo">SaO·</span>
        <nav class="template-header-nav">
            <a href="index.jsp" class="template-header-navItem isActive">首页</a>
            <a href="pinker/topicList.jsp" class="template-header-navItem">发现</a>
            <a href="pinker/topicList.jsp" class="template-header-navItem" >话题</a>
        </nav>
        <!--搜索框-->

        <div class="template-search-bar">
            <input type="text" name="" id="topic-searchInput" value="" placeholder="你感兴趣的话题。。。" />
            <ul class="searchResult-box">
            </ul>
        </div>
        <div class="template-search-buttonWrap">
            <input type="button" class="template-search-button" />
        </div>
        <!--右侧登录注册以及头像-->
        <div class="right template-header-right">

            <c:choose>
                <c:when test="${user!=null}">
                    <div class="template-userInfo">

                        <div class="head-menuwrap" style="display: none">
                            <ul>
                                <li><a href="pinker/Myblo.jsp"><img src="pinker/img/icon/account.png" alt="" height="18px" width="18px">&nbsp;个人主页</a></li>
                                <li><a href="pinker/PersonPage.jsp"><img src="pinker/img/icon/set.png" alt="" height="18px" width="18px">&nbsp; 个人信息</a></li>
                                <li><a id="loginOut-a" href="javascript:void(0)"><img src="pinker/img/icon/error.png" alt="" height="18px" width="18px">&nbsp; 退出登录</a></li>
                            </ul>
                        </div>
                        <div class="head-img">
                                <%--<span class="head-username">${user.username}</span>--%>
                            <img id="head-personheadimg" src="http://localhost:8080/pinker/IOServlet?method=loadHeadImg" height="30px" width="30px" style="margin-top: 8px"/>
                        </div>
                            <input type="hidden" value="${user.id}" id="userId">
                            <%--好友请求框--%>
                            <%--<div class="friendRequest">--%>

                                <%--<%--%>
                                    <%--pk_user user=(pk_user) request.getSession().getAttribute("user");--%>

                                        <%--FriendService friendService=new FriendServiceImpl();--%>
                                        <%--List<Friend> friList=friendService.getAllFriByUserIdAndStatue(user.getId(),0);--%>
                                        <%--request.setAttribute("friList",friList);--%>

                                    <%--List<Friend> trueFri=friendService.getAllFriByUserIdAndStatue(user.getId(),1);--%>
                                        <%--request.setAttribute("trueFri",trueFri);--%>
                                <%--%>--%>
                                <%--&lt;%&ndash;<img src="pinker/img/朋友.png" height="30px" width="30px" >&ndash;%&gt;--%>
                                <%--<div class="friendRequestwrap-box">--%>
                                    <%--<table class="friendRequestwrap-table">--%>
                                        <%--<c:forEach items="${friList}" var="fri">--%>
                                            <%--<tr>--%>
                                                  <%--<td>  ${fri.friend.username}</td>--%>
                                                <%--<td>    <button onclick="receive(${fri.friend.id},$(this))">接受</button></td>--%>
                                            <%--</tr>--%>
                                        <%--</c:forEach>--%>
                                    <%--</table>--%>

                                <%--</div>--%>
                            <%--</div>--%>


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