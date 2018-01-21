function sendMeg(info,userId) {
    var data={
        key:"8ab9713227d64f6e8c215ad8e0f86671",
        info:info,
        userId:"userId"
    }

    $.ajax({
        type:"post",
        url:"http://www.tuling123.com/openapi/api",
        data:data,
        dataType:"json",
        success:function (result) {
            analysis(result);


        }
    })
}


function analysis(result) {
    switch (result.code){
        case 100000:
            ana100(result);
            break;
        case 200000:
            ana200(result);
            break;
        case 302000:
            ana302(result);
            break;
        case 308000:
            ana308(result);
            break;
    }
    $(".message").scrollTop($(".message").scrollTop()+10000);
}

// 文字类
function ana100(result) {
    var msgWrap=$(".message");
    var text=result.text;
    var textDiv=$("<div class=\"send\">" +
        // "<div class=\"time\">"+getDate()+"</div>" +
        "<div class=\"msg\">" +
        "<img src=\"pinker/img/LOGO.jpg\" alt=\"\">" +
        "<p><i class=\"msg_input\"></i>"+text+"</p>" +
        "</div>" +
        "</div>");

    msgWrap.append(textDiv);
}


// 链接类
function ana200(result) {
    var msgWrap=$(".message");
    var text=result.text;
    var url=result.url;
    var textDiv=$("<div class=\"send\">" +
        // "<div class=\"time\">"+getDate()+"</div>" +
        "<div class=\"msg\">" +
        "<img src=\"pinker/img/LOGO.jpg\" alt=\"\">" +
        "<p><i class=\"msg_input\"></i>"+text+"<br><a target='_blank' href=\""+url+"\">"+url+"</a></p>" +
        "</div>" +
        "</div>");

    msgWrap.append(textDiv);

}


// 新闻类
function ana302(result) {
    var list=result.list;
    var msgWrap=$(".message");
    $.each(list,function (i,news) {
        var textDiv=$("<div class=\"send\">" +
            // "<div class=\"time\">"+getDate()+"</div>" +
            "<div class=\"msg\">" +
            "<img src=\"pinker/img/LOGO.jpg\" alt=\"\">" +
            "<p><i class=\"msg_input\"></i>"+news.article+"<br>"+news.source+"<br>"+"<img src='"+news.icon+"'>"+"<br><a target='_blank' href='"+news.detailurl+"'>"+news.detailurl+"</a>s</p>" +
            "</div>" +
            "</div>");
        msgWrap.append(textDiv);
    })



}


//菜谱类
function ana308(result) {
    var list = result.list;
    var msgWrap = $(".message");
    $.each(list, function (i, cookboox) {
        var textDiv = $("<div class=\"send\">" +
            // "<div class=\"time\">" + getDate() + "</div>" +
            "<div class=\"msg\">" +
            "<img src=\"pinker/img/LOGO.jpg\" alt=\"\">" +
            "<p>" +
            "<i class=\"msg_input\"></i>" + cookboox.name + "<br>" + cookboox.info + "<br>" + "<img src='" + cookboox.icon + "'>" + "<br><a target='_blank' href='" + cookboox.detailurl + "'>" + cookboox.detailurl + "</a>s</p>" +
            "</div>" +
            "</div>");
        msgWrap.append(textDiv);
    })
}



//获取时间日期
function getDateString(date) {
    var year=date.getYear();
    var month=date.getMonth()+1;
    var day=date.getDate();
    var hour=date.getHours();
    var minute=date.getMinutes();
    var second=date.getSeconds();

    return year+"年"+month+"月"+day+"日  "+hour+":"+minute+":"+second;
}



