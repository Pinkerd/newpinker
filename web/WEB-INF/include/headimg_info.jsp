<%--
  Created by IntelliJ IDEA.
  User: OONE
  Date: 2017/12/31
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--头像与背景显示-->
<div class="Card">
    <div class="Card-showInfo">
        <div class="shadow">
            <div class="Card-headImg">
                <a href="javascript:void(0)"><img src="http://localhost:8080/pinker/IOServlet?method=loadHeadImg" width="100px" height="100px" title="更换头像" /></a>
            </div>
        </div>
        <div class="Card-nameAndIntro">
            <div class="card-username">
                <h3>${user.username}</h3>
            </div>

            <div class="card-intro">
                <span style="font-size: 13px;">${user.introduction}</span>
            </div>
        </div>
    </div>
</div>

<div class="head-img-box" >
    <div class="img-box">
        <img src="" id="yushow" onclick="uploadBtn()" title="更换头像" height="150px" width="150px"/>
        <button class="btn-uploading" onclick="syncUpload();"><i class="icon-uploading"></i>上传图片</button>
        <button class="img-cancel" id="cancel-Btn">取消</button>
    </div>
    <input type="file" name="file" style="display:none;height: 200px;width: 200px;" onchange="previewImg(this);" id="upload" accept="image/*"/>
</div>
