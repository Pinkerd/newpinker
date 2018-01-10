/**
 * 动态关注人数
 */
// function loadCommentCount() {
//     var topicId=$("#topicId").val();
//     $.post("http://localhost:8080/pinker/ConcernTopicServlet?method=concernCout",
//         {topicId:topicId},
//         function (concerntcount) {
//             $(".count").text(concerntcount);
//         })
// }



/**
 * 动态获取博文个数
 */
function loadTopicCount() {
    var topicId=$("#topicId").val();
    $.post("http://localhost:8080/pinker/ConcernTopicServlet?method=blogCout",
        {topicId:topicId},
        function (blogCount) {
            $("#nowrap").text(blogCount);
        })
}

 $(function () {
     loadTopicCount();
 })
