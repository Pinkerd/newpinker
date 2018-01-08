<%@ page import="com.pinker.service.UserService" %>
<%@ page import="com.pinker.service.Impl.UserServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <%@include file="/WEB-INF/include/base_info.jsp"%>
    <link rel="stylesheet" type="text/css" href="pinker/css/Template.css" />
    <link rel="stylesheet" type="text/css" href="pinker/css/PersonPage.css" />
    <link rel="stylesheet" type="text/css" href="pinker/css/myblo.css"/>
    <link rel="stylesheet" type="text/css" href="pinker/css/myblo1.css"/>
    <link rel="stylesheet" type="text/css" href="pinker/css/MyTopic.css" />
    <link rel="stylesheet" type="text/css" href="pinker/css/MyTopic1.css" />
    <link rel="stylesheet" type="text/css" href="pinker/css/head_info.css">
    <script type="text/javascript" src="pinker/js/otherPage.js"></script>
    <script type="text/javascript" src="pinker/js/head_info.js"></script>
    <script type="text/javascript" src="pinker/js/otherpage/otherPageTopic.js"></script>
    <style rel="stylesheet" type="text/css">
        .card-functionArea{
            position:absolute ;
            right: 10px;
            bottom: 10px;
        }

        .requetStatue{
            border: 1px solid white;
            background: rgb(150,150,150);
            color: white;
            height: 30px;
            width: 100px;
        }

        .addFriendBtn{
            border: 1px solid white;
            background: #f23962;
            color: white;
            height: 30px;
            width: 100px;
        }


        .deleteFriend{
            border: 1px solid white;
            background: green;
            color: white;
            height: 30px;
            width: 100px;
        }

        .left-myTopic{
            margin-top: 3px;
            background: white;
            box-shadow: 1px 1px 3px grey;
            border-radius: 3px;
            min-height: 500px;
            padding: 20px 0px;
        }
    </style>


    <title></title>

</head>

<body>
<!--模板容器-->
<div class="template-body">

    <%@include file="/WEB-INF/include/head_info.jsp"%>

    <%

        UserService userService= new UserServiceImpl();
        int otherId=Integer.parseInt(request.getParameter("otherId"));
        pk_user other=new pk_user();
        other.setId(otherId);
        other=userService.findByUserId(otherId);
        request.setAttribute("other",other);
    %>

    <!--模板结束-->
    <div class="template-main-body">

        <input type="hidden" value="${other.id}" id="otherId">
        <input type="hidden" value="${user.id}" id="userId">
        <div class="Card">
            <div class="Card-showInfo">
                <div class="shadow">
                    <div class="Card-headImg">
                        <img src="http://localhost:8080/pinker/IOServlet?method=loadOtherHeadImg&userId=${other.id}" width="100px" height="100px"  />
                    </div>
                </div>
                <div class="Card-nameAndIntro">
                    <div class="card-username">
                        <h3>${other.username}</h3>
                    </div>

                    <div class="card-intro">
                        <span style="font-size: 13px;">你莫拽，我有你照片</span>
                    </div>
                </div>
            </div>


            <%--功能区--%>
            <div class="card-functionArea">
                <div class="addBtn-wrap">
                    <button class="addFriendBtn" onclick="addFriend()">加为好友</button>
                    <button class="requetStatue">待接受</button>
                    <button class="deleteFriend" onclick="deleteFriend()">删除好友</button>
                </div>
            </div>
        </div>



        <div class="template-body-left">
            <!--在这里写左边-->

            <!--左侧状态栏-->
            <div class="left-status">
                <ul class="left-statusUl">
                    <li class="left-status-sate statusActive">动态</li>
                    <li class="left-status-publish">发布</li>
                    <li class="left-status-attention">收藏与关注</li>
                    <li class="left-status-perInfo">个人信息</li>
                </ul>
            </div>

            <!--个人信息-->

            <!--发布的话题-->
            <div class="left-myTopic">

            </div>

            <!--发布的博文-->
            <div class="left-myBlog">

                <div class="left-attentionTopic">



                </div>



            </div>

        </div>

        <div class="template-body-right">
            <!--在这里写右边-->

            <!--关注数-->
            <div class="statistics">
                <div class="attentionCount">
                    <h3>345</h3>
                    <span>关注</span>
                </div>

                <div class="funsCount">
                    <h3>234</h3>
                    <span>被关注</span>
                </div>
            </div>

            <!--右侧-->
            <div class="right-menu">
                <ul>

                    <div class="menu-myTopic">
                       <a href="http://localhost:8080/pinker/pinker/othersPageTopic.jsp?otherId=${other.id}"><li>发布的话题</li></a>>
                    </div>

                    <div class="menu-myBlog">
                       <a href="http://localhost:8080/pinker/pinker/othersPage.jsp?otherId=${other.id}"> <li>发布的博文</li></a>
                    </div>

                </ul>

            </div>

    </div>

</div>

<div class="head-img-box" >
    <div class="img-box">
        <img src="" id="yushow" onclick="uploadBtn()" title="更换头像" height="150px" width="150px"/>
        <button class="btn-uploading" onclick="syncUpload();"><i class="icon-uploading"></i>上传图片</button>
        <button class="img-cancel" id="cancel-Btn">取消</button>
        <%--<a class="shan" onclick="deleteImg();"><img src="/images/www.jpg">删除图片</a>--%>
    </div>
    <input type="file" name="file" style="display:none;height: 200px;width: 200px;" onchange="previewImg(this);" id="upload" accept="image/*"/>
    <%--<input type="button" class="startUpLoadBtn" value="开始上传" >--%>
</div>


</body>

</html>