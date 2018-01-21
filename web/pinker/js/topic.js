/**
 * 动态获取博文个数
 */
function loadTopicCount() {
    var topicId=$("#topicId").val();
    $.post("/pinker/ConcernTopicServlet?method=blogCout",
        {topicId:topicId},
        function (blogCount) {
            $("#nowrap").text(blogCount);
        })
}

 $(function () {
     loadTopicCount();
 })

/**
 *  分页获取话题
 */
function loadTopicByPageNum(pageNum){
    $.post("/pinker/pkTopicServlet?method=findByPageNum",{pageNum:pageNum},function (pageJ) {
        var page=JSON.parse(pageJ);
        if(page.totalPage==pageNum){
            $(".db a").text("没有更多了");

        }
        $.each(page.data,function (i,topic) {
            var div=$("<div class=\"template-body-left-body\">\n" +
                "<div class=\"content\">\n" +
                "<a href=\"pinker/topic_blogList.jsp?topicId="+topic.id+"\" class=\"item-link\" style=\"background-image: url(http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId="+topic.id+");\">\n" +
                "<span class=\"mask\" >\n" +
                "<span class=\"name\">"+topic.title+"</span>\n" +
                "</span>\n" +
                "</a>\n" +
                "<div class=\"visitFBZ\">\n" +
                "发布者 : "+topic.user.username+"<br>\n" +
                topic.publishtime +
                "</div>\n" +
                "</div>\n" +
                "</div>");
            $(".template-body-left-1-neirong").append(div);
        })

    })
}

$(function () {
    var i=1;
    loadTopicByPageNum(i);

    $(".db").click(function () {
        i++;
        loadTopicByPageNum(i)
    })

})


