<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 18-10-24
  Time: 下午4:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--2个样式表文件-->
<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css"/>
<!--2个js文件 ,要先引入jquery,然后再引入easyui-->
<script src="../easyui/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../easyui/jquery.easyui.min.js" type="text/javascript" charset="utf-8"></script>
<!DOCTYPE html>
<html lang="zh-CN">
<script>
    $(function () {
        $("#submit").click(function () {

            /*校验密码*/
            var pValue = document.getElementById("password").value;
            if(pValue == "") {
                $.messager.alert("消息提醒","密码不能为空!","warning");
                return false;
            }

            /*校验确认密码*/
            var rpValue = document.getElementById("repassword").value;
            if(rpValue != pValue) {
                $.messager.alert("消息提醒","俩次输入密码不一致!","warning");
                return false;
            }
            var data = $("#form").serialize();
            $.ajax({
                type:"post",
                url:"RegisterServlet?method=forgetPassword",
                data:data,
                dataType:"text",
                success:function (msg) {
                    if("success" == msg){
                        $.messager.alert("消息提醒","重置成功","warning")
                        function hello(){
                            window.location.href = "LoginServlet?method=logout"
                        }
                        window.setTimeout(hello,1500)
                    }else{
                        $.messager.alert("消息提醒",msg,"error")
                    }
                }
            })
        })
    })



</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>忘记密码</title>
    <style>
        * { margin: 0; padding: 0; }
        html { height: 100%; }
        body { height: 100%; background: #fff url(../images/backgroud.png) 50% 50% no-repeat; background-size: cover;}
        .dowebok { position: absolute; left: 50%; top: 50%; width: 430px; height: 650px; margin: -300px 0 0 -215px; border: 1px solid #fff; border-radius: 20px; overflow: hidden;}
        .logo { width: 104px; height: 104px; margin: 50px auto 80px; background: url(../images/login.png) 0 0 no-repeat; }
        .form-item { position: relative; width: 360px; margin: 0 auto; padding-bottom: 30px;}
        .form-item input { width: 360px; height: 48px; padding-left: 70px; border: 1px solid #fff; border-radius: 25px; font-size: 18px; color: #fff; background-color: transparent; outline: none;}
        .form-item button { width: 360px; height: 50px; border: 0; border-radius: 25px; font-size: 18px; color: #1f6f4a; outline: none; cursor: pointer; background-color: #fff; }
        #username { background: url(../images/emil.png) 20px 14px no-repeat; }
        #mobile { background: url(../images/emil.png) 23px 11px no-repeat; }
        #password { background: url(../images/password.png) 23px 11px no-repeat; }
        #repassword { background: url(../images/password.png) 23px 11px no-repeat; }
        .reg-bar { width: 360px; margin: 20px auto 0; font-size: 14px; overflow: hidden;}
        .reg-bar a { color: #fff; text-decoration: none; }
        .reg-bar a:hover { text-decoration: underline; }
        .reg-bar .reg { float: left; }
        .reg-bar .forget { float: right; }
        .dowebok ::-webkit-input-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok :-moz-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok ::-moz-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok :-ms-input-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}

        @media screen and (max-width: 500px) {
            * { box-sizing: border-box; }
            .dowebok { position: static; width: auto; height: auto; margin: 0 30px; border: 0; border-radius: 0; }
            .logo { margin: 50px auto; }
            .form-item { width: auto; }
            .form-item input, .form-item button, .reg-bar { width: 100%; }
        }
    </style>
</head>
<body>
<div class="dowebok">
    <div class="logo"></div>
    <form id="form" class="form" method="post">
        <div class="form-item">
            <input id="username" type="text" autocomplete="off" placeholder="邮箱" name="Name">
        </div>
        <div class="form-item">
            <input id="mobile" type="text" autocomplete="off" placeholder="输入预留电话" name="Mobile">
        </div>
        <div class="form-item">
            <input id="password" type="password" autocomplete="off" placeholder="输入新密码" name="Password" >
        </div>
        <div class="form-item">
            <input id="repassword" type="password" autocomplete="off" placeholder="再次输入密码" name="rePassword" >
        </div>
        <div class="form-item"><button id="submit" type="button">修 改</button></div>
    </form>
</div>


</body>
</html>
