function toBold() {
    window.getSelection().getRangeAt(0).surroundContents(document.createElement("b"));
}

function toItalic() {
    window.getSelection().getRangeAt(0).surroundContents(document.createElement("i"));
}

function updateBlog(){
	var blogData=$("#blog-textdiv").html();
	var title=$(".blogTitle-input").val();
	var topicId=$(".topicId-home").val();
	console.log(title);
	
	$.ajax({
		url:"BlogServlet?method=publishBlog",
		type:"post",
		data:{blogData:blogData,title:title,topicId:topicId},
		dataType:"text",
		success:function(result){
			if(result="true"){
				alert("发布成功");
                window.location.assign("http://localhost:8080/pinker/pinker/topic_blogList.jsp?topicId="+topicId);
			}else{
				alert("发布保存博文失败");
			}
		}
	})
	
	
}




