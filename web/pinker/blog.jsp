<%@ page import="com.pinker.service.BlogDaoService" %>
<%@ page import="com.pinker.service.Impl.BlogDaoServiceImpl" %>
<%@ page import="com.pinker.entity.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@include file="/WEB-INF/include/base_info.jsp"%>
	<link rel="stylesheet" type="text/css" href="pinker/css/Template.css" />
	<link rel="stylesheet" type="text/css" href="pinker/css/Blog.css">
	<link rel="stylesheet" type="text/css" href="pinker/css/left.css" />
	<link rel="stylesheet" type="text/css" href="pinker/css/right.css" />
	<link rel="stylesheet" type="text/css" href="pinker/css/head_info.css">
	<script type="text/javascript" src="pinker/js/head_info.js"></script>
	<script type="text/javascript" src="pinker/js/blog.js"></script>


	<title></title>
</head>

<body>
<!--模板容器-->
<div class="template-body">
	<!--头部容器-->
	<%@include file="/WEB-INF/include/head_info.jsp"%>
	<!--论题-->
	<%
		int blogId=Integer.parseInt(request.getParameter("blogId"));
		BlogDaoService blogDaoService= new BlogDaoServiceImpl();
		Blog thisBlog=blogDaoService.getBlogById(blogId);
		request.setAttribute("thisBlog",thisBlog);
 	%>


	<input type="hidden" value="${thisBlog.id}" id="blogId">

	<div class="page_top">
		<!--论题头部-->
		<div class="page_topHeader">
			<!--讨论话题的内容-->
			<div class="page_topcontent">
				<div class="page-border">
					<div class="page_topcontentmain">
						<div class="page_topcontenttags">
							<div class="page_topcontenttopics">
								<div class="page_topcontentTopics">
									<a href="topic_blogList.jsp">社交网络</a>
								</div>
								<div class="page_topcontentTopics">
									<a href="topic_blogList.jsp">心理学</a>
								</div>
								<div class="page_topcontentTopics">
									<a href="topic_blogList.jsp">人际交往</a>
								</div>
								<div class="page_topcontentTopics">
									<a href="topic_blogList.jsp">社交产品</a>
								</div>
								<div class="page_topcontentTopics">
									<a href="topic_blogList.jsp">互联网社交</a>
								</div>
							</div>
						</div>
						<h1 class="page_topcontenttitle">
							${thisBlog.title}
						</h1>

					</div>

					<div class="page_topcontentside">
						<div class="page-collector">
							<div class="collector-name">收藏者</div>
							<div class="collector-value">4875</div>
						</div>
						<div class="item">
							<div class="item-name">被浏览</div>
							<div class="item-value">509544</div>
						</div>

					</div>
					<!--讨论论题的底部-->

					<div class="page_topfoot">
						<div class="page_topfootmain">
							<div class="page_topfootGroup">
								<button class="page-attention"></button>
								<a class="page-review" href="#">我要评论</a>
							</div>
							<%--<div class="page_topfootAction">
								<div class="page_topfootActioncomment">
									<button class="button3">
										<img class="button3-img" src="pinker/img/评论.png" width="20px " height="20px"/>
										5条评论
									</button>
								</div>
								<div class="page_topfootActionshareMenu">
									<button class="button4">
										<img src="pinker/img/分享.png" width="20px" height="20px"/>
										转发
									</button>
								</div>
							</div>--%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--模板结束-->
	<div class="template-main-body">
		<div class="template-body-left">
			<!--在这里写左边-->
			<div class="data-reactid">
				<div class="contentITem-meta">
					<div class="author-info">
						<div class="Popover">
							<img src="http://localhost:8080/pinker/IOServlet?method=loadOtherHeadImg&userId=${thisBlog.user.id}" width="37px" height="37px" />
						</div>
						<div class="AuthorInfo-content">
							<div class="AuthorInfo-head">
								<a href="#">
									${thisBlog.user.username}
								</a>
							</div>
							<div class="AuthorInfo-detail">
								${thisBlog.user.introduction }
							</div>
						</div>

					</div>
					<div class="AnswerItem-extraInfo">
						收录于 编辑推荐 &nbsp;圆桌 299 人赞同了该回答
					</div>

				</div>
				<div class="RichContent-inner">
							<span class="RichText">
								${thisBlog.content}
							</span>
				</div>
				<div class="ContentItem-time">
					<a href="#">编辑于 2017-02-28</a>
				</div>

				<div class="ContentItem-actions">
							<span>
								<button  class="left-Thumb">
									<img src="pinker/img/点赞.png" width="25px" height="20px" id="zan"/>
								</button>

							</span>
					<button class="left-comment">
						<img class="button3-img" src="pinker/img/评论.png" width="20px" height="20px" style="position: relative;bottom: 7px;"/>
						<a style="display: inline-block;position: relative;bottom:2px;left: 6px;"><span class="commentCountBox"></span>条评论</a>
					</button>

					<button class="left-dividual">
						<img src="pinker/img/分享.png" width="20px" height="20px" style="position: relative;top: 3px;"/>
						<a style="display: inline-block;position: relative;bottom:2px;left: 4px;">分享</a>
					</button>

					<button class="left-collect">
						<img src="pinker/img/收藏.png" width="20px" height="20px" style="position: relative;top: 3px;"/>
						<a style="display: inline-block;position: relative;bottom:2px;left: 4px;">收藏</a>
					</button>
				</div>
				<%--评论框--%>
				<div class="Comments-container">
					<div class="Comments-top">
						<div class="Topbar-title">
							<div class="pl-count">
								<h2><span class="commentCountBox"></span>条评论</h2>
									<%--<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
									<script type="text/javascript">
                                        (document).ready(function () {
                                            var blogId=$("#blogId").val();
                                            $.post("http://localhost:8080/pinker/CommentServlet?method=findCountbyBlogId",{blogId:blogId},function (findcountJ) {
                                                var findCount=JSON.parse(findcountJ);
                                                var number=$(
                                                    "<h2>"+findCount+"条评论"+"</h2>"
                                                );
                                                $(".pl-count").append(number);
                                            })
									</script>--%>
							</div>
						</div>

					</div>
					<hr />
					<div>
						<div class="commentList">

						</div>
					</div>


					<ul id="comment-ulwrap">
						<%--<li>--%>
							<%--<img src="pinker/img/111.jpg" height="30px" width="30px"><span><a href="">我叫神仙</a></span>--%>
							<%--<div>nude我的大额的的的的的 </div>--%>
						<%--</li>--%>
					</ul>



					<c:if test="${user!=null}">

					<div class="Comments-foot">
							<div class="foot-comment">
								<input type="text" name="comment" id="comment-input" placeholder="写下你的评论" />
								<button id="foot-comment">评论</button>
							</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>

		<div class="template-body-right">
			<!--在这里写右边-->
			<div class="Card">
				<div class="Cardhead">
					<div class="CardheadText">相关问题</div>
					<hr />
				</div>
				<div class="Cardsection">
					<div class="Cardsectionitem">
						<a href="blog.jsp" target="_blank">你最孤独的时刻是什么？</a>
						22733个回答
					</div>
					<div class="Cardsectionitem">
						<a href="blog.jsp" target="_blank">生活中有哪些常见且易被忽略的不礼貌行为？</a>
						1288个回答
					</div>
					<div class="Cardsectionitem">
						<a href="blog.jsp" target="_blank">好友间的关系是如何变淡的？</a>
						9837个回答
					</div>
					<div class="Cardsectionitem">
						<a href="blog.jsp" target="_blank">什么时候会让你觉得群众是愚蠢的？</a>
						6228个回答
					</div>
					<div class="Cardsectionitem">
						<a href="blog.jsp" target="_blank">朋友圈里常发什么样的图片的人比较讨厌</a>
						3021个回答
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#zan").click(function () {
            alert("666");
            /*  $("#zan").attr("src", "img/已赞.png");*/
            if($("#zan").attr("src")=="/img/点赞.png"){
                $("#zan").attr("src", "img/已赞.png");
            }else{
                $("#zan").attr("src", "img/点赞.png");
            }
        })
    })
</script>

<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/Template.js"></script>
<script type="text/javascript">

    var blogId= $("#blogId").val();

    $(document).ready(function() {
        $.ajax({
            url:"http://localhost:8080/pinker/CollectionBlogServlet?method=findCollectionBlogByUserId",
            type:"post",
            data:{blogId:blogId},
            dataType:"text",
            success:function (result) {
                //alert(result);
                //这个result是个字符串
                if (result=="true"){
                    //alert("true")
                    //能查到id说明已关注  点击取消关注
                    $(".page-attention").html("取消收藏");
                 // $(".page-attention").unbind("click");
                    $(".page-attention").click(del);
                }else{
                    //alert("false")
                    //为null说明没关注  点击关注
                    $(".page-attention").html("收藏");
                //    $(".page-attention").unbind("click");
                    $(".page-attention").click(save);
                }
            }
        })
    });

function save() {
    //关注
    $.ajax({
        url:"http://localhost:8080/pinker/CollectionBlogServlet?method=saveCollectionBlog",
        type:"post",
        data:{blogId:blogId},
        dataType:"text",
        success:function (result) {
            if(result!="0"){
                //（删除数据）取消关注后，显示关注问题文字
                $(".page-attention").unbind("click");
                $(".page-attention").click(del);
                $(".page-attention").html("取消收藏");
            }
        }
    })
}
function del() {
    //取关
    $.ajax({
        url:"http://localhost:8080/pinker/CollectionBlogServlet?method=deleteCollectionBlog",
        type:"post",
        data:{blogId:blogId},
        dataType:"text",
        success:function (result) {
            if (result!="0"){
                //（增加数据）点击关注，显示取消问题文字
                $(".page-attention").unbind("click");
                $(".page-attention").click(save);
                $(".page-attention").html("收藏");
            }
        }
    })
}
</script>
</html>