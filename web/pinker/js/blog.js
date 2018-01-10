function loadComment() {
    $(".commentList").html("");
var blogId=$("#blogId").val();
$.post("CommentServlet?method=getselectAll",{blogId:blogId},function (listJ) {
    var list=JSON.parse(listJ);

    for(var i=0;i<list.length;i++){
        var li=$("<li>\n" +
            "<img src=\"http://localhost:8080/pinker/IOServlet?method=loadOtherHeadImg&userId="+list[i].user.id+"\" height=\"25px\" width=\"25px\"><span><a href=\"http://localhost:8080/pinker/pinker/othersPage.jsp?otherId="+list[i].userId+"\">"+list[i].user.username+"</a></span>\n" +
            "<div>"+list[i].content+" </div>\n" +
            "</li>");
        $("#comment-ulwrap").append(li);
        /*var Li=$(
            "<div class='CommentItem'>"+
            "<div>"+
            "<div class='CommentItem-meta'>"+
            "<div class='Popover'>"+
            "<img src=\"http://localhost:8080/pinker/IOServlet?method=loadOtherHeadImg&userId="+list[i].user.id+"\" height=\"25px\" width=\"25px\"><span><a href=\"http://localhost:8080/pinker/pinker/othersPage.jsp?otherId="+list[i].userId+"\">"+list[i].user.username+"</a></span>\n"+
            "</div>"+
            "</div>"+
            "<div class='CommentItem-content'>"+
            "<p>"+list[i].content+"</p>"+
            "</div>"+
            //"<div class='CommentItem-footer'>"+
           /!* "<button class='CommentItem-Thumb'>"+
            "<img src='img/点赞.png' width='25px' height='20px'/>"+"赞"+
            "</button>"+
            "<button class='CommentItem-revert'>"+
            "<img src='img/回复.png' width='16px' height='16px'/>"+"回复"+
            "</button>"+*!/
           // "</div>"+
            "</div>"+
            "<hr />"+
            "</div>"
        )
        $(".commentList").append(Li);*/
    }
})
}

/**
 * 动态获取评论数
 */
function loadCommentCount() {
    var blogId=$("#blogId").val();
    $.post("http://localhost:8080/pinker/CommentServlet?method=findCountbyBlogId",{blogId:blogId},function (findcount) {
        $(".commentCountBox").text(findcount);
    })
}

$(function () {
    loadComment();
    loadCommentCount();
    $("#foot-comment").click(function () {
        var content=$("#comment-input").val();
        var blogId=$("#blogId").val();
        $.post("CommentServlet?method=saveCom",{comment:content,blogId:blogId},function (result) {
            if(result=="true"){
                $("#comment-input").html("");
                loadComment();
                loadCommentCount();
            }
        })
    })
})