<%@ page contentType="text/html;charset=UTF-8" language="java" %>


    <div id="turlin-box">
		<header class="header">
			<h5 class="tit">知性助手</h5>

			<div class="right"></div>
		</header>
		<div class="message">

           <a href=""></a>
			<!--接受信息-->
			<div class="send">
				<div class="time">05/22 06:30</div>
				<div class="msg">
					<img src="pinker/img/LOGO.jpg" alt="" >
					<p><i class="msg_input"></i>我是知性组手，知识从未如此性感，让我们开始一场愉快的交流吧！</p>
				</div>
			</div>

			<!--&lt;!&ndash;发送信息&ndash;&gt;-->
			<!--<div class="show">-->
				<!--<div class="time">05/22 06:30</div>-->
				<!--<div class="msg">-->
					<!--<img src="聊天界面_files/touxiangm.png" alt="">-->
					<!--<p><i clas="msg_input"></i>你好你好你好</p>-->
				<!--</div>-->
			<!--</div>-->

		<!--发送区域-->
		<div class="footer">
			<input type="text" id="msgInputBox">
			<p id="sendMsg">发送</p>
		</div>
		</div>
    </div>

	<div id="showBtn-box">
		<button id="showBtn" style="position: fixed;top: 70px;right: 0;z-index: 1000;height: 50px;background: cornflowerblue;color: white;border: 0;outline: 0;width: 100px">知性组手</button>
	</div>

<script type="text/javascript" >
    $(function () {
        var msgWrap=$(".message");
        $("#sendMsg").click(function () {
            var info=$("#msgInputBox").val();
            var sendDiv=$("<div class=\"show\">\n" +
//                "<div class=\"time\">"+getDate()+"</div>\n" +
                "<div class=\"msg\">\n" +
                "<img src=\"http://localhost:8080/pinker/IOServlet?method=loadHeadImg\" alt=\"\">\n" +
                "<p><i clas=\"msg_input\"></i>"+info+"</p>\n" +
                "</div>\n" +
                "</div>");
            msgWrap.append(sendDiv);
            sendMeg(info,123123);
            $(".message").scrollTop($(".message").scrollTop()+10000);
            $("#msgInputBox").val("");

        })

		//回车提交
        $("#msgInputBox").keypress(function (e) {
            if(e.keyCode==13){
                $("#sendMsg").trigger("click");
            }
        })


		//点击消失



		$("#showBtn").click(function () {
            $("#turlin-box").fadeToggle();
        })


    })



</script>

