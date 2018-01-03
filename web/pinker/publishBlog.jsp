<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <%@include file="/WEB-INF/include/base_info.jsp"%>
		<link rel="stylesheet" type="text/css" href="pinker/css/publishBlog.css"/>
		<script type="text/javascript" src="pinker/js/publishblog.js"></script>
		
		<title></title>
	</head>
	<body>

	<h1 align="center">博文发布</h1>
        <input type="hidden" class="topicId-home" value="1">
		<div id="publisBlog-box">
			<div id="blog-titlebox">
				<span>标题：</span><input type="text" class="blogTitle-input" value="" />
			</div>
			
			<div id="publishBlog-tool">
				<button class="publishBlog-bold" onclick="toBold()">B</button>
				<button class="publishBlog-italic" onclick="toItalic()">I</button>
			</div>
			
			<div id="blog-textdiv" contenteditable="true">
				
				
				
				
			</div>
			
			<div id="publishandsetting">
				
				<button id="publishBlogBtn" onclick="updateBlog()">提交博客</button>
				<%--<button onclick="test()">show</button>--%>
			</div>
			
		</div>
		
		
	</body>
</html>
