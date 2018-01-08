<%@ page import="com.pinker.service.TopicService" %>
<%@ page import="com.pinker.service.Impl.TopicServiceImpl" %>
<%@ page import="com.pinker.entity.pk_topic" %>
<%@ page import="com.pinker.service.BlogDaoService" %>
<%@ page import="com.pinker.service.Impl.BlogDaoServiceImpl" %>
<%@ page import="com.pinker.entity.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/include/base_info.jsp"%>
		<link rel="stylesheet" type="text/css" href="pinker/css/Template.css"/>
		<link rel="stylesheet" type="text/css" href="pinker/css/zhwz.css">
		<link rel="stylesheet" type="text/css" href="pinker/css/head_info.css">
		<script type="text/javascript" src="pinker/js/Template.js"></script>
		<script type="text/javascript" src="pinker/js/head_info.js"></script>

		<%
			int topicId=Integer.parseInt(request.getParameter("topicId"));
			TopicService topicService=new TopicServiceImpl();
			BlogDaoService blogDaoService= new BlogDaoServiceImpl();
			pk_topic topic=topicService.selectOne(topicId);
			List<Blog> blogList=blogDaoService.findTopicBlogList(topicId);
			request.setAttribute("thisTopic",topic);
			request.setAttribute("thisBlogList",blogList);
		%>

		<script type="text/javascript">


            $(function () {
                //获取serclet地址
                var url="${pageContext.request.contextPath}/ConcernTopicServlet?method=hasConcern";

                var data={topicId: ${thisTopic.id}}

                /*关注按钮*/
                var $conBtn=$("#title-attentionBtn");
                $.post(url,data,function (result) {

                    if(result=="true"){/*存在的情况*/
                        $conBtn.text("取消关注");
                        $conBtn.unbind("click");
                        $conBtn.click(deleteConcern);

                    }else{/*不存在的情况*/
                        $conBtn.text("关注");
                        $conBtn.unbind("click");
                        $conBtn.click(concernTopic);
                    }
                })


                /**
                 * 添加关注
                 */
                function concernTopic() {
                    var url="${pageContext.request.contextPath}/ConcernTopicServlet?method=addConc";
                    $.post(url,data,function (result) {
                        if(result=="true"){
                            $conBtn.text("取消关注");
                            $conBtn.unbind("click");
                            $conBtn.click(deleteConcern);
                        }
                    })
                }

                /**
                 * 删除关注
                 */
                function deleteConcern() {
                    var url="${pageContext.request.contextPath}/ConcernTopicServlet?method=deleteConc";
                    $.post(url,data,function (result) {
                        if(result=="true"){
                            $conBtn.text("关注");
                            $conBtn.unbind("click");
                            $conBtn.click(concernTopic);
                        }
                    })
                }



            })


		</script>


		<title></title>
	</head>



		<div class="template-body">
			<!--头部容器-->

			<%@include file="/WEB-INF/include/head_info.jsp"%>
			<!--模板结束-->
			<div class="template-main-body">

				<div class="template-body-left">
					<!--在这里写左边-->
					<div class="content1">
					  	<image width="200px" height="200px" src="http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId=${thisTopic.id}" class="cztp" />
						<div class = "content">
							<div class = 'title'>
								<a > <span class="title1">${thisTopic.title}</span></a>
								<%--<span class="status" >已结束</span>--%>
							</div>
						</div>
					   </a>
			           <div class="content2">
				          <div class="desciption">${thisTopic.content}</div>
						  <div class="actions">
							
							<a class="button-link-share " href="#"><image src = "pinker/img/share.jpg" class="s-jpg" width="25px"/>分享</a>
							<span class="visits-num">17921665 次浏览 •</span>
							<span class="count" > 849</span> 人关注
							<button ID="title-attentionBtn">关注</button>
						  </div>
				       </div>
					</div>

					<div class="module">
						<ul class="menu-nav-horizontal">
							<li class = "block1"><a href="pinker/publishBlog.jsp?topicId=${thisTopic.id}"><span class="nowrap">发表博文</span></a></li>
							<li class = "block2" ><a href="">31 <span class="nowrap">个问题</span></a></li>
							<li class = "block3" ><a href="">17 <span class="nowrap">条讨论</span></a></li>
						</ul>
					</div>
					<div class="main-article">
					<%--博客列表--%>
					<c:forEach items="${thisBlogList}" var="blog">
						<div class="main-article01">
							<div class="main-article01-top" >
								<a href="pinker/blog.jsp?blogId=${blog.id}">${blog.title}</a>
							</div>
							<div class="author-info">
								<a class="author-name" href="http://localhost:8080/pinker/pinker/othersPage.jsp?otherId=${blog.userId}"><img class="author-img" src="http://localhost:8080/pinker/IOServlet?method=loadOtherHeadImg&userId=${blog.userId}" width="25px" style="border-radius: 3px;"/>${blog.user.username}</a>
								<span class="author-introduce">${blog.user.introduction}</span>
							</div>
							
							<div class="article-introduce">
								${blog.content.length()>120?blog.content.substring(0,120):blog.content}
							</div>
							
							<div class="stylell">
								<a href="pinker/blog.jsp?blogId=${blog.id}">
									<img src="img/icon/lr.jpg" class="head-img04">
									<span class="txt-img04">浏览</span>
								</a>
								<a href="#">
									<img src="img/icon/pl.jpg" class="head-img05">
									<span class="txt-img05">收藏</span>
								</a>
							</div>
						</div>
					</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</body>
</html>
