

function receive(data,ele) {

    $.ajax({
        url:"FriendServlet?method=recieveFri",
        type:"post",
        data:{userId:data},
        dataType:"text",
        success:function (result) {
            console.log(result);
            if(result=="true"){
                alert("接受成功");
                ele.parents("tr").remove();
            }else{
                alert("接受失败");
            }
        }
    })

}