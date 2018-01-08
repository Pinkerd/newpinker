function loadComment() {
    $("#comment-ulwrap").html("");
var blogId=$("#blogId").val();
$.post("CommentServlet?method=getselectAll",{blogId:blogId},function (listJ) {
    var list=JSON.parse(listJ);
    for(var i=0;i<list.length;i++){
        var li=$("<li>\n" +
            "<img src=\"http://localhost:8080/pinker/IOServlet?method=loadOtherHeadImg&userId="+list[i].user.id+"\" height=\"25px\" width=\"25px\"><span><a href=\"http://localhost:8080/pinker/pinker/othersPage.jsp?otherId="+list[i].userId+"\">"+list[i].user.username+"</a></span>\n" +
            "<div>"+list[i].content+" </div>\n" +
            "</li>");

        $("#comment-ulwrap").append(li);
    }

})

}

$(function () {
    loadComment();


    $("#foot-comment").click(function () {
        var content=$("#comment-input").val();
        var blogId=$("#blogId").val();
        $.post("CommentServlet?method=saveCom",{comment:content,blogId:blogId},function (result) {
            if(result=="true"){
                $("#comment-input").val("");
                loadComment();
            }


        })



    })



})