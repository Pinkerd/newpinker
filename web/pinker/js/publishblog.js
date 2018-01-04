function toBold() {
    window.getSelection().getRangeAt(0).surroundContents(document.createElement("b"));
}

function toItalic() {
    window.getSelection().getRangeAt(0).surroundContents(document.createElement("i"));
}

function updateBlog(){
	var blogData=$("#blog-textdiv").html();
	var title=$(".blogTitle-input").val();
	console.log(title);
	
	$.ajax({
		url:"BlogServlet?method=publishBlog",
		type:"post",
		data:{blogData:blogData,title:title,topicId:$(".topicId-home").val()},
		dataType:"text",
		success:function(result){
			if(result="true"){
				alert("发布成功");
				window.location.reload();
			}else{
				alert("发布保存博文失败");
			}
		}
	})
	
	
}




