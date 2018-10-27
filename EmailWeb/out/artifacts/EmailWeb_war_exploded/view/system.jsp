<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 18-10-8
  Time: 下午5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>海客邮箱</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../easyui/css/default.css" />
    <link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css" />
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../easyui/js/outlook2.js"> </script>
    <script type="text/javascript">
        var _menus = {
            "menus": [{
                "menuid": "1",
                "menuname":"收件管理",
                "icon":"icon-accept",
                "menus": [{
                    "menuid": "11",
                    "menuname":"收件箱",
                    "icon":"icon-accept",
                    "url": "AcceptMailServlet?method=AcceptMailView"
                }],
            },
                {
                    "menuid": "2",
                    "menuname":"发件管理",
                    "icon":"icon-send",
                    "menus": [{
                        "menuid": "21",
                        "menuname":"写信",
                        "icon":"icon-send",
                        "url": "SendMailServlet?method=SendMailView"
                    },
                    {
                        "menuid": "22",
                        "menuname":"发件箱",
                        "icon":"icon-send",
                        "url": "S"
                    }]
            },
                {
                "menuid": "3",
                "menuname":"通讯管理",
                "icon":"icon-man1",
                "menus": [{
                    "menuid":"31",
                    "menuname":"联系人",
                    "icon":"icon-man1",
                    "url":"ContactorServlet?method=ContactorView"
                }]
            },
                {
                    "menuid": "4",
                    "menuname": "密码管理",
                    "icon": "icon-lock",
                    "menus": [{
                        "menuid": "41",
                        "menuname": "修改密码",
                        "icon": "icon-lock",
                        "url": "SystemServlet?method=PersonView"
                    }]
            }]
        }


    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
    <div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
        <img src="../images/noscript.gif" alt='抱歉，请开启脚本支持！' />
    </div>
</noscript>
<div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(../images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
    <span style="float:right; padding-right:20px;" class="head"><span style="color:red; font-weight:bold;">${user.name}&nbsp;</span>您好&nbsp;&nbsp;&nbsp;<a href="LoginServlet?method=logout" id="loginOut">安全退出</a></span>
    <span style="padding-left:10px; font-size: 16px; ">海客邮箱</span>
</div>
<div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
    <div class="footer" align="center">Copyright &copy; By 胡旭东</div>
</div>
<div region="west" hide="true" split="true" title="导航菜单" style="width:180px;" id="west">
    <div id="nav" class="easyui-accordion" fit="true" border="false">
        <!--  导航内容 -->
    </div>

</div>
<div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
    <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
        <jsp:include page="welcome.jsp" />
    </div>
</div>

<iframe width=0 height=0 src="refresh.jsp"></iframe>

</body>
</html>