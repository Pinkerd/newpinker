<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/11 0011
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript" src="/pinker/pinker/js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#sendMessage").click(function () {
                var message=$("#messageBox").val();

                var data={
                    key:"4eb91a6ca4d84b93b373466389558e58",
                    info:message,
                    userId:"18260070151"
                }
                var dataJ=JSON.stringify(data);

                $.post("http://www.tuling123.com/openapi/api",dataJ,function (resultJ) {
//                    var result=JSON.parse(resultJ);
//                    alert(result.text);
                        alert("aaaa");
                })
            })


        })


    </script>
</head>
<body>

<div id="messageInfo">

<<a href="http://localhost:8080/pinker/pinker/emailTakeBack2.jsp">SSSS</a>

</div>

<input type="text" id="messageBox">
<button id="sendMessage">发送</button>


</body>
</html>
