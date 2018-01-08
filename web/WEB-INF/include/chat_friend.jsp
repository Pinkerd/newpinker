<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="friend-speak-wrap">
    <div class="show-friendBox">
        <ul class="show-friendUl">

        </ul>
        <button class="prev-friendpage">上一页</button>
        第<span class="pagebum-span">1</span>页
        <button class="next-friendpage">下一页</button>
    </div>

    <div class="friend-requestBox">
        <ul class="friRequest-ul">

        </ul>
    </div>


    <div class="show-friendBtnbox">
        <button id="showFriendBtn">好友</button>
        <button id="friend-request">好友申请</button>
    </div>

</div>

<script type="text/javascript">

    $(function () {
        loadRequest();
        var pageNum=parseInt($(".pagebum-span").text());
        var prev=$(".prev-friendpage");
        var next=$(".next-friendpage");
        loadFriend(1);
        prev.click(loadFriend(pageNum-1));
        next.click(loadFriend(pageNum+1));


    })


    /**
     * 载入好友列表
     */
    function loadFriend(index) {
        $.post("http://localhost:8080/pinker/FriendServlet?method=findFriendPage",{index:index},function (pageJ) {
            var page=JSON.parse(pageJ);
            var ul=$(".show-friendUl");
            var pageNum=$(".pagebum-span");
            var prev=$(".prev-friendpage");
            var next=$(".next-friendpage");

            prev.attr("disable",false);
            next.attr("disable",false);
            ul.html("");
            for(var i=0;i<page.data.length;i++) {
                var li = $("<li> <img src=\"http://localhost:8080/pinker/IOServlet?method=loadOtherHeadImg&userId="+page.data[i].friendId+"\" width=\"40px\" height=\"40px\"/>\n" +
                    "                <a href=\"http://localhost:8080/pinker/pinker/othersPage.jsp?otherId="+page.data[i].friendId+"\"><span>"+page.data[i].friend.username+"</span></a></li>");
                ul.append(li);
            }
            pageNum.text(page.pageNumber);
            if(page.pageNumber>=page.totalPage){
                prev.attr("disable",true);
            }

            if(page.pageNum<=page.totalPage){
                next.attr("disable",true);
            }

        })
    }

    /**
     * 删除好友
     */
    function deleteFri(friId) {


    }


    /**
     * 载入申请列表
     */
    function loadRequest() {
        $.post("http://localhost:8080/pinker/FriendServlet?method=haveFriendReq",function (listJ) {
            var list=JSON.parse(listJ);
            var ul=$(".friRequest-ul");
            ul.html("");
            for(var i=0;i<list.length;i++){

            var li=$("<li>\n" +
                "                <span class=\"friend-name\">"+list[i].friend.username+" </span>\n" +
                "                <button class=\"friend-receive\" onclick=\"receive("+list[i].friendId+")\">接受</button>\n" +
                "                <button class=\"friend-refuse\" onclick=\"refuse("+list[i].friendId+")\">拒绝</button>\n" +
                "            </li>");
                ul.append(li);
            }


        })
    }

    /**
     * 接受申请
     */
    function receive(friId) {
        $.post("http://localhost:8080/pinker/FriendServlet?method=recieveFri",{userId:friId},function (result) {
                loadRequest();
            loadFriend(1);
        })
    }

    /**
     * 拒绝申请
     */
    function refuse(friId) {
        $.post("http://localhost:8080/pinker/FriendServlet?method=deleteFri",{friendId:friId},function (result) {
            if(result=="true"){
                loadRequest();
                loadFriend(1);
            }
        })
    }

</script>



