

// function receive(data,ele) {
//
//     $.ajax({
//         url:"FriendServlet?method=recieveFri",
//         type:"post",
//         data:{userId:data},
//         dataType:"text",
//         success:function (result) {
//             console.log(result);
//             if(result=="true"){
//                 alert("接受成功");
//                 ele.parents("tr").remove();
//             }else{
//                 alert("接受失败");
//             }
//         }
//     })
//
// }

$(function () {
    $("#head-personheadimg").click(function () {
        $(".head-menuwrap").toggle();
    })


    $("#loginOut-a").click(function () {
        $.post("UsersServlet?method=loginOut",function (result) {
            if(result=="ok"){

                window.location.href="http://localhost:8080/pinker/index.jsp";
            }
        })
    })


    //模糊搜索
    $("#topic-searchInput").keyup(function () {

        var searchKey=$("#topic-searchInput").val();
        $(".searchResult-box").html("");
        if(searchKey==""){
            return false;
        }
        $.post("pkTopicServlet?method=fuzzSearch",{searchKey:searchKey},function (searchResult) {
            var result=JSON.parse(searchResult);

            for(var i=0;i<result.length;i++){
                var li="<li><a href=\"pinker/topic_blogList.jsp?topicId="+result[i].id+"\">"+result[i].title+"</a></li>";
                $(".searchResult-box").append(li);
            }


        })

    })


})

