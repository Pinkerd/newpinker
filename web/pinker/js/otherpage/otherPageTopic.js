
$(function () {


    showTopic()





})



function showBlog() {
    var otherId=$("#otherId").val();
    $.post("/pinker/OtherServlet?method=findOtherBlog",{otherId:otherId},function (result) {
        var list=JSON.parse(result);
        for(var i=0;i<list.length;i++){
            var item=$("<div class=\"blog-wrap\">\n" +
                "                        <div class=\"blog-title-wrap\">\n" +
                "                            <a href=\"/pinker/BlogServlet?method=selectblogOne&blogId="+list[i].id+"\">"+list[i].title+"</a>\n" +
                "                        </div>\n" +
                "                        <div class=\"blog-info\">\n" +
                "                            <span>"+list[i].publishtime+"</span>·<span>16 个回答</span>·<span>55 个关注</span>\n" +
                "                        </div>\n" +
                "                    </div>");

            $(".left-myTopic").append(item);
        }
    })
}


function showTopic() {
    var otherId=$("#otherId").val();
    var $topicDiv="<div class=\"left-attentionTopic\"></div>";

    $.post("/pinker/OtherServlet?method=findOtherTopic",{otherId:otherId},function (result) {
        var list=JSON.parse(result);
        for(var i=0;i<list.length;i++){
            var item=$("<div class=\"topic-wrap\">\n" +
                "\t\t\t\t\t\t\t\t<div class=\"topic-img\">\n" +
                "\t\t\t\t\t\t\t\t\t<img src=\"http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId="+list[i].id+"\" width=\"60px\" height=\"60px\" />\n" +
                "\t\t\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t\t\t\t<div style=\"width: 400px\" class=\"topic-title\">\n" +
                "\t\t\t\t\t\t\t\t\t<a href=\"pinker/topic_blogList.jsp?topicId="+list[i].id+"\"><h3>"+list[i].title+"</h3></a>\n" +
                "\t\t\t\t\t\t\t\t\t<div class=\"detail-wrap\" hidden>\n" +
                "\t\t\t\t\t\t\t\t\t\t<div class=\"detail-img\">\n" +
                "\t\t\t\t\t\t\t\t\t\t\t<img src=\"http://localhost:8080/pinker/IOServlet?method=loadTopicImg&topicId="+list[i].id+"\" width=\"60px\" height=\"60px\"/>\n" +
                "\t\t\t\t\t\t\t\t\t\t</div>\n" +
                "\n" +
                "\t\t\t\t\t\t\t\t\t\t<div class=\"detail-introduce\" >\n" +
                "\t\t\t\t\t\t\t\t\t\t\t<span class=\"detail-span\">\n" +
                "\t\t\t\t\t\t\t\t\t\t\t\t\t"+list[i].content.substr(0,50)+"\n" +
                "\t\t\t\t\t\t\t\t\t\t\t</span>\n" +
                "\t\t\t\t\t\t\t\t\t\t</div>\n" +
                "\n" +
                "\t\t\t\t\t\t\t\t\t\t<div class=\"detail-buttonwrap\">\n" +
                "\n" +
                "\t\t\t\t\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t\t\t\t<div class=\"topic-introduce\">\n" +
                "\t\t\t\t\t\t\t\t\t\t"+list[i].content.substr(0,50)+"\n" +
                "\t\t\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t\t\t</div>");
            $(".left-myTopic").append(item);

        }
    })




}
