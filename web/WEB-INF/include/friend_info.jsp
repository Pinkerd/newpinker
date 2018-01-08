<%@ page import="com.pinker.entity.Page" %>
<%@ page import="com.pinker.service.FriendService" %>
<%@ page import="com.pinker.service.Impl.FriendServiceImpl" %>
<%@ page import="com.pinker.entity.pk_user" %>
<%@ page import="com.pinker.entity.Friend" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/2 0002
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right-myFriend">
    <div class="friend-nav">
        <h3>好友</h3>
    </div>

    <%
        FriendService friendService=new FriendServiceImpl();
        pk_user friendUser= (pk_user) request.getSession().getAttribute("user");
        Page<Friend> friendPage=new Page<Friend>();
        friendPage.setPageSize(5);
        friendPage.setPageNumber(1);
        friendPage=friendService.findFriendByUserId(friendPage,friendUser);
        request.setAttribute("friendPage",friendPage);
    %>



    <c:forEach items="${friendPage.data}" var="fri">
    <hr />
    <div class="right-friendwarp">
        <div class="right-headIMG left">
            <img src="http://localhost:8080/pinker/IOServlet?method=loadOtherHeadImg&userId=${fri.friendId}" height="50px" width="50px" />
        </div>
        <div class="right-friendInfo">
            <a href="OtherServlet?method=toOthersPage&userId=${fri.friendId}">
                <h4>${fri.friend.username}</h4></a>
            <span class="introduce">人最软弱的地方，是舍不得。</span>
        </div>
        <div class="friend-manager">

        </div>
    </div>
    </c:forEach>
    <div class="friend-manager">
        <button class="friend-up">上一页</button>
        <input readonly="" type="text" name="pageCode" id="pageCode" value="1/178" class="friend-pageCode" />
        <button class="friend-down">下一页</button>
    </div>

</div>