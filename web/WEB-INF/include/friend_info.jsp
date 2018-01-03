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



    <c:forEach items="${trueFri}" var="fri">
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
</div>