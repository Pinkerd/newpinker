<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/16
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>密码安全中心-修改密码</title>
</head>
<style>
    *{margin: 0px;padding: 0px}
    .header{
        width: 100%;
        height: 15%;
        background-color:rgb(59,89,153);
    }
    .title{
        width: 150px;
        height: 30px;
        font-size: 30px;
        line-height: 30px;
        text-align: center;
        padding-top:25px ;
        color: white;
        float: left;
        display: inline-block;
    }
    .userName{
        border: 1px red solid;
        width:100px;
        height: 20px;
        line-height: 20px;
        text-align: center;
        float: right;
        margin-top: 30px;
    }
    .userHeader{
        border: 1px red solid;
        width: 60px;
        height: 60px;
        float: right;
        margin-top: 10px;
        margin-right: 100px;
    }
    .byEmail{
        width: 30%;
        height: 30%;
        /*border: solid 1px red;*/
        float: left;
        margin-top: 10%;
        margin-left: 10%;
        background-color:rgb(59,89,153);
    }
    .byQA{
        width: 30%;
        height: 30%;
        /* border: solid 1px red;*/
        float: right;
        margin-top: 10%;
        margin-right: 15%;
        background-color:rgb(59,89,153);
    }
    .innnerTitle{
        width: 200px;
        height: 50px;
        line-height: 50px;
        font-size: 20px;
        text-align: center;
        /* border:  1px solid red;*/
        float: left;
        color: white;
        margin-top:70px;
        margin-left: 20px;
    }
    .pswBox{
       /* border: 1px red solid;*/
        width: 20%;
        height: 20%;
        margin: 13% 0% 0% 17%;
        float: left;

    }
    .QABox{
       /* border: 1px red solid;*/
        width: 20%;
        height:30%;
        margin: 12% 22% 0% 0%;
        float: right;
    }


</style>
<body>
<div class="header">
    <img src="img/安全中心.png"  style="float:left;width: 55px;height: 60px;margin-top: 10px;margin-left: 100px">
    <div class="title">安全中心</div>
    <div class="userHeader">用户头像</div>
    <div class="userName">用户名</div>
</div>

<div class="byEmail">
    <img src="img/修改密码.png" style="width: 100px;height: 80px;float: left;margin-top:55px;margin-left:45px">
    <div class="innnerTitle" id="changePsw" style="margin-left: 0px">修改密码</div>
</div>

<div class="byQA">
    <img src="img/通过密码提示问题找回.png"  style="width: 100px;height: 80px;float: left;margin-top: 55px;margin-left:30px">
    <div class="innnerTitle" id="changeQA">修改密码提示问题</div>
</div>

<div class="pswBox">
    <form action="UsersServlet?method=updatePassword" method="post">

        <table align="center"   >
            <input type="text" name="id" value="${user.id}" style="display: none" />
            <tr>
                <td class="name">原密码</td>
                <td><input type="password" class="oldPassword" name="oldPassword" id="oldPassword"></td>
            </tr>

            <tr>
                <td class="name">新密码</td>
                <td><input type="password" class="newPassword" name="newPassword" id="newPassword"></td>
            </tr>

            <tr>
                <td class="name">重复密码</td>
                <td><input type="password" class="newPassword" name="newPasswordAg" id="newPasswordAg"></td>
            </tr>
        </table>
        <input type="submit" class="changePasswordBtn" id="changePasswordBtn" value="修改" style="margin-left:70px">
        <input type="button"  class="changePasswordCancelBtn" id="cancelChange" value="返回" style="margin-left: 30px">
    </form>
</div>

<div class="QABox">
    <form action="UsersServlet?method=updatePassword" method="post">
        <table>
            <tr>
                <td>问题1</td>
                <td>
                    <select name="pswQ1" class="QAq1" style="width: 173px" value="${user.pswQ1}">
                        <option value="${user.pswQ1}">${user.pswQ1}</option>
                        <option value="你父亲的姓名">你父亲的姓名</option>
                        <option value="你父亲的职业">你父亲的职业</option>
                        <option value="你父亲的生日">你父亲的生日</option>
                        <option value="你母亲的姓名">你母亲的姓名</option>
                        <option value="你母亲的职业">你母亲的职业</option>
                        <option value="你母亲的生日">你母亲的生日</option>
                        <option value="你配偶的姓名">你配偶的姓名</option>
                        <option value="你配偶的职业">你配偶的职业</option>
                        <option value="你配偶的生日">你配偶的生日</option>
                        <option value="你的出生地">你的出生地</option>
                        <option value="你学号(工号)">你学号(工号)</option>
                        <option value="小学班主任名字">小学班主任名字</option>
                        <option value="初中班主任名字">初中班主任名字</option>
                        <option value="高中班主任名字">高中班主任名字</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>答案1</td>
                <td><input type="text" name="pswA1" class="QAa1" rows="10" cols="50" value="${user.pswA1}"  style="width: 173px" required="required"></td>
            </tr>
            <tr>
                <td>提示2</td>
                <td>
                    <select name="pswQ2" style="width: 173px" class="QAq2">
                        <option value="${user.pswQ2}">${user.pswQ2}</option>
                        <option value="你父亲的姓名">你父亲的姓名</option>
                        <option value="你父亲的职业">你父亲的职业</option>
                        <option value="你父亲的生日">你父亲的生日</option>
                        <option value="你母亲的姓名">你母亲的姓名</option>
                        <option value="你母亲的职业">你母亲的职业</option>
                        <option value="你母亲的生日">你母亲的生日</option>
                        <option value="你配偶的姓名">你配偶的姓名</option>
                        <option value="你配偶的职业">你配偶的职业</option>
                        <option value="你配偶的生日">你配偶的生日</option>
                        <option value="你的出生地">你的出生地</option>
                        <option value="你学号(工号)">你学号(工号)</option>
                        <option value="小学班主任名字">小学班主任名字</option>
                        <option value="初中班主任名字">初中班主任名字</option>
                        <option value="高中班主任名字">高中班主任名字</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>答案2</td>
                <td><input type="text" name="pswA2" class="QAa2" rows="10" cols="50"  value="${user.pswA2}" style="width: 173px" required="required"></td>
            </tr>
            <tr>
                <td>提示3</td>
                <td>
                    <select name="pswQ3" style="width: 173px" class="QAq3">
                        <option value="${user.pswQ3}">${user.pswQ3}</option>
                        <option value="你父亲的姓名">你父亲的姓名</option>
                        <option value="你父亲的职业">你父亲的职业</option>
                        <option value="你父亲的生日">你父亲的生日</option>
                        <option value="你母亲的姓名">你母亲的姓名</option>
                        <option value="你母亲的职业">你母亲的职业</option>
                        <option value="你母亲的生日">你母亲的生日</option>
                        <option value="你配偶的姓名">你配偶的姓名</option>
                        <option value="你配偶的职业">你配偶的职业</option>
                        <option value="你配偶的生日">你配偶的生日</option>
                        <option value="你的出生地">你的出生地</option>
                        <option value="你学号(工号)">你学号(工号)</option>
                        <option value="小学班主任名字">小学班主任名字</option>
                        <option value="初中班主任名字">初中班主任名字</option>
                        <option value="高中班主任名字">高中班主任名字</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>答案3</td>
                <td><input type="text" class="QAa3" name="pswA3" rows="10" cols="50"  value="${user.pswA3}"  style="width: 173px" required="required"></td>
            </tr>
        </table>
        <input type="submit" class="changePasswordBtn" id="changePasswordBtn1" value="修改" style="margin-left:70px">
        <input type="button"  class="changePasswordCancelBtn" id="cancelChange1" value="返回" style="margin-left: 30px">
     </form>
</div>


<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $(".pswBox").hide();

        $(".byEmail").click(function () {
            $(".byEmail").hide();
            $(".pswBox").show();
        })

        $("#cancelChange").click(function () {
            $(".byEmail").show();
            $(".pswBox").hide();
        })

        $(".QABox").hide();

        $(".byQA").click(function () {
            $(".byQA").hide();
            $(".QABox").show();
        })

        $("#cancelChange1").click(function () {
            $(".byQA").show();
            $(".QABox").hide();
        })

        /*密码表单验证*/
        $("#changePasswordBtn").click(function () {
            var oldPsw=$("#oldPassword").val();
            var psw="${user.password}";
            var psw1 = $("[id=newPassword]").val();
            var psw2 = $("[id=newPasswordAg]").val();
            var pswPatrn = /^[a-zA-Z0-9_-]{6,18}$/;  //校验密码：只能输入6-20个字母、数字、下划线
            //密码的验证和判断
            if (!pswPatrn.test(psw1)) {
                alert("密码需要是6~20位的字母数字下划线和横线！");
                return false;
            }
            //确认密码的判断
            if(oldPsw!=psw){alert("旧密码输入错误！");return false;}
            if (psw1 != psw2) { alert("两次密码输入的不一致！");return false; }
            if (psw1== psw) {alert("新密码不能与旧密码一致！");return false;}
            if (psw2== psw) {alert("新密码不能与旧密码一致！");return false;}
        })
        /*提示问题验证*/
        $("#changePasswordBtn1").click(function () {
            var q1=$(".QAq1").val();
            var q2=$(".QAq2").val();
            var q3=$(".QAq3").val();
            var a1=$(".QAa1").val();
            var a2=$(".QAa2").val();
            var a3=$(".QAa3").val();

            if(q1=="" || q2=="" || q3==""){
                alert("请选择问题！");
                return false;
            }else {
                if(q1==q2 || q2==q3 || q1==q3){
                    alert("问题不能重复！");
                    return false;
                }
            }

        })

    })


</script>
</body>
</html>
