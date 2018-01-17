<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/15
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <head>
        <title>完整demo</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
        <script type="text/javascript" charset="utf-8" src="../UEditor-utf8-jsp/ueditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="../UEditor-utf8-jsp/ueditor.all.min.js"> </script>
        <script type="text/javascript" charset="utf-8" src="../UEditor-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
        <style type="text/css">
            div{width:100%;}
            #editor{width: 800px;height: 300px;margin: 0px auto;}
        </style>
    </head>
<body>
    <div>
    <h1 align="center">话题发布</h1>
    <script id="editor" type="text/plain"></script>
    </div>

    <div id="btns">
            <button onclick="getContent()">提交</button>
    </div>




    <script type="text/javascript">
        var ue = UE.getEditor('editor');
        function getContent() {
           /* var arr = [];
            arr.push(UE.getEditor('editor').getContent());
            alert(arr.join("\n"));*/
           var str=UE.getEditor('editor').getContent();
           alert(str);
        }
    </script>


</body>
</html>
