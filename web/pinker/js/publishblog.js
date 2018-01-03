function ii() {

	var txt = "";
	if(document.selection) {
		txt = document.selection.createRange();
	} else {
		txt = document.getSelection();
	}
	
	alert(txt);
	
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

			}else{
				alert("发布保存博文失败");
			}
		}
	})
	
	
}




