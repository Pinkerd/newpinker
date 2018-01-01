$(function () {

    var userId=$("#userId").val();
    var otherId=$("#otherId").val();
    $.ajax({
        url:"FriendServlet?method=friendStatue",
        type:"post",
        data:{userId:userId,otherId:otherId},
        dataType:"text",
        success:function (result) {
            hideFriBtn();
            if(result=="0"){
                $(".requetStatue").css("display","inline-block");
            }else if(result=="1"){
                $(".deleteFriend").css("display","inline-block");
            }else if(result=="2"){
                $(".addFriendBtn").css("display","inline-block");
            }

        }
    })
})



function hideFriBtn() {
    $(".addFriendBtn").css("display","none");
    $(".deleteFriend").css("display","none");
    $(".requetStatue").css("display","none");
}



function addFriend() {
    var userId=$("#userId").val();
    var otherId=$("#otherId").val();
    $.ajax({
        url:"OtherServlet?method=friendRequest",
        type:"post",
        data:{userId:userId,otherId:otherId},
        dataType:"text",
        success:function (result) {
            if(result=="true"){
                alert("发送好友请求成功");
                $(this).css("display","none");
            }else{
                alert("发送好友请求失败");
            }
        }
    });
}

