<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <%@include file="/WEB-INF/include/base_info.jsp"%>
		<link rel="stylesheet" type="text/css" href="pinker/css/publishBlog.css"/>
		<script src="pinker/js/publishTopic.js"></script>
		<title></title>

        <style rel="stylesheet" type="text/css">
            .topicImg-box{
                margin: 10px 0px;
            }

            #yushow{
                text-align: center;
                line-height: 200px;
                font-size: 28px;
                background: rgba(200,200,200,0.5);
                color: rgb(100,100,100);
            }

        </style>
	</head>
	<body>

	<h1 align="center">话题发布</h1>
        <input type="hidden" class="topicId-home" value="1">
		<div id="publisBlog-box">
			<div id="blog-titlebox">
				<span>标题：</span><input type="text" class="blogTitle-input" value="" />
			</div>
			
			<div id="publishBlog-tool">
				<button class="publishBlog-bold" onclick="toBold()">B</button>
				<button class="publishBlog-italic" onclick="toItalic()">I</button>
                <button class="publishBlog-onloadBtn" onclick="uploadBtn()">图</button>
			</div>
            <div class="topicImg-box">
                 <img src="" id="yushow" onclick="" title="话题图" height="200px" width="200px"/>
             </div>
            <div id="blog-textdiv" contenteditable="true">

				
			</div>
			
			<div id="publishandsetting">
				
				<button id="publishBlogBtn" onclick="updateTopic()">提交话题</button>
			</div>
			
		</div>

	<div class="head-img-box" >
		<div class="img-box">

		</div>
		<input type="file" name="file" style="display:none;height: 200px;width: 200px;" onchange="previewImg(this);" id="upload" accept="image/*"/>
	</div>

	</body>
</html>
