<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/7 0007
  Time: 0:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="right-menu">
    <ul>

        <div class="menu-attentionTopic">
           <a href="pinker/CollectTopic.jsp"> <li>关注的话题</li></a>
        </div>

        <div class="menu-attentionBlog">
          <%--<a href="pinker/CollectBlog.jsp">  <li>收藏的博文</li></a>--%>
              <a href="CollectionBlogServlet?method=concernTopicList">  <li>收藏的博文</li></a>
        </div>

        <div class="menu-myTopic">
            <a href="pinker/MyTopic.jsp"> <li>发布的话题</li></a>
        </div>

        <div class="menu-myBlog">
            <a href="pinker/Myblo.jsp"><li>发布的博文</li></a>
        </div>

        <div class="menu-myBlog">
            <a href="pinker/PersonPage.jsp"><li>个人信息</li></a>
        </div>


    </ul>

</div>

