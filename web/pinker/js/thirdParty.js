
var thirdUser;//蓝鲸灵用户对象
var cornerUser;//阔南酒店用户对象
//蓝精灵，获取第三方数据，返回用户的json对象
function getLanThirdData(url) {
    $.ajax({
        url:url,
        type: 'post',
         data: "",
        async: false,
        dataType:'JSONP',//以js形式实现跨域获取数据
        jsonp:"callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
        xhrFields: {
            withCredentials: true
        },//添加跨域名请求参数
        crossDomain: true,//添加跨域名请求参数
        success:function(data){
            var dataJ=JSON.stringify(data);
            lanThirdLogin(dataJ,"smurfsThird");
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            /*alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);*/
            return null;
        }
    })
}


//阔南，获取第三方数据，返回用户的json对象
function getCorThirdData(url) {
    $.ajax({
        url:url,
        type: 'post',
        data: "",
        async: false,
        dataType:'JSONP',//以js形式实现跨域获取数据
        jsonp:"callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
        xhrFields: {
            withCredentials: true
        },//添加跨域名请求参数
        crossDomain: true,//添加跨域名请求参数
        success:function(data){
            var dataJ=JSON.stringify(data);
            corThirdLogin(dataJ,"corThird");
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            /*alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);*/
            return null;
        }
    })
}




//蓝精灵，将用户提交到后端进行第三方登录
function lanThirdLogin(myUser,myMethod) {

        $.post("/pinker/ThirdServlet?method="+myMethod,{myUser:myUser},function (result) {
        if(result=="true"){
            window.location.href="/pinker/index.jsp";
        }else {
            $("#lanThirdInfo-div").show();
        }
    })
}

//阔南，后端第三方登录
function corThirdLogin(myUser,myMethod) {

    $.post("/pinker/ThirdServlet?method="+myMethod,{myUser:myUser},function (result) {
        if(result=="true"){
            window.location.href="/pinker/index.jsp";
        }else {
            alert("阔南无登录用户");
        }
    })
}


function lanLogin(lanjinglingUrl) {
    var username=$("#lanLoginName").val();
    var password=$("#lanPassword").val();


    $.ajax({
        url:"http://172.27.35.4:8080/OtherServlet?method=loginThird&callback=flightHandler",
        type: 'post',
        data: {username:username,password:password},
        async: false,
        dataType:'JSONP',//以js形式实现跨域获取数据
        jsonp:"callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
        xhrFields: {
            withCredentials: true
        },//添加跨域名请求参数
        crossDomain: true,//添加跨域名请求参数
        success:function(data){
            alert(data);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        }


})

}
/**
 * 页面加载后执行
 */
$(function () {
    //蓝精灵服务url
    var lanjinglingUrl="http://172.27.35.4:8080/OtherServlet?method=thirdService&callback=flightHandler";
    //阔南服务url
    var cornerUrl=" *********** :8080/CustomerAll?methodName=thirdPartyLogin&callback=flightHandler";

    //后端蓝精灵第三方登录方法名
    var lanMethod="smurfsThird";
    //后端阔南第三方登录方法名
    var cornerMethod="cornerThird";


    //蓝精灵登录
    $("#ShowLanThirdLogin").click(function () {
        getLanThirdData(lanjinglingUrl);
    })

    //阔南登录
    $("#showCorThirdLogin").click(function () {
        getCorThirdData(cornerUrl);
    })


    $("#closeLanLoginBtn").click(function () {
        $("#lanThirdInfo-div").hide();
    })


    $("#lanLoginBtn").click(function () {
        lanLogin(lanjinglingUrl);
    })



})

