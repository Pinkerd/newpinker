<%@ page import="java.util.ArrayList" %>
<%@ page import="com.pinker.entity.pk_user" %><%--
  Created by IntelliJ IDEA.
  pk_user: Administrator
  Date: 2017/12/28
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查询结果</title>
</head>
<style>
    #page_nav{
        width: 100%;
        height: 10px;
        margin: auto;
        text-align: center;
    }
    .historyback{
        width: 50px;
        text-align: center;
        margin: 0px auto;
    }
    .historyback a{
        color:black;
        text-decoration: none;
    }
</style>
<body>
<h1 align="center">查询结果</h1>

<table border="1"  width="60%" align="center" style="text-align: center">

            <tr>
                <td>用户ID</td>
                <td>登录名</td>
                <td>密码</td>
                <td>用户名</td>
                <td>email</td>
                <td>角色ID</td>
                <td>当前状态</td>
                <td>创建时间</td>
                <td>最后登陆</td>
                <td>居住地</td>
                <td>毕业学校</td>
                <td>性别</td>
                <td>生日</td>
                <td>星座</td>
                <td>个人简介</td>
                <td>头像</td>
                <td>操作</td>
            </tr>

             <c:forEach  items="${page.data}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.loginName}</td>
                    <td>${user.password}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.roleId}</td>
                    <td>${user.status}</td>
                    <td>${user.createtime}</td>
                    <td>${user.lastlogin}</td>
                    <td>${user.residence}</td>
                    <td>${user.school}</td>
                    <td>${user.gender}</td>
                    <td>${user.birthday}</td>
                    <td>${user.constellation}</td>
                    <td>${user.introduction}</td>
                    <td>${user.header}</td>
                    <td>
                        <a href="#" onclick="window.confirm('确定删除用户?  ID：${user.id}/用户名：${user.username}')?
                                this.href='http://localhost:8080/pinker/UsersServlet?method=freezeUser&id=${user.id}&status=${user.status}'
                                :this.href='javascript:void()';">还原/冻结</a>
                    </td>
                </tr>
            </c:forEach>

        </table>

<%--分页--%>
<br>



<div id="page_nav">
    <a href="http://localhost:8080/pinker/UsersServlet?method=findUser&pageNumber=1" class="firstpage">首页</a>
    <a href="http://localhost:8080/pinker/UsersServlet?method=findUser&pageNumber=${page.pageNumber-1}" class="firstpage">上一页</a>
    <%--遍历生成页码--%>
    <c:forEach begin="1" end="${page.totalPage}" var="index">
        <c:choose>
            <c:when test="${index==page.pageNumber}">
                <span style="color: deeppink">[${page.pageNumber}]</span>
            </c:when>
            <c:otherwise>
                <a href="http://localhost:8080/pinker/UsersServlet?method=findUser&pageNumber=${index}">
                        ${index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <a href="http://localhost:8080/pinker/UsersServlet?method=findUser&pageNumber=${page.pageNumber+1}"  class="endpage">下一页</a>
    <a href="http://localhost:8080/pinker/UsersServlet?method=findUser&pageNumber=${page.totalPage}"  class="endpage">末页</a>
    共${page.totalPage}页，${page.totalRecord}条记录 到第
    <input value="${page.pageNumber}" name="pn" id="pn_input" style="width: 30px;height: 20px"/>页
    <input type="button" value="确定" id="jump" name="jump">
</div><br>
<div class="historyback"><a>返回</a></div>
<script type="text/javascript"  src="pinker/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $(document).ready(function(){

        $(".historyback").click(function () {
            window.history.back();
        })

        if (${page.pageNumber==1}){
            $(".firstpage").css("display", "none");
        }
        if (${page.pageNumber==page.totalPage}){
            $(".endpage").css("display", "none");
        }

        $("#jump").click(function () {
            var no= $("#pn_input").val();
            var i=parseInt(no);
            if(i>${page.totalPage}){
                i=${page.totalPage};
            }
            if(i<1){
                i=1;
            }
            location.href="http://localhost:8080/pinker/UsersServlet?method=findUser&pageNumber="+i;
        })

    });
</script>
</body>
</html>
