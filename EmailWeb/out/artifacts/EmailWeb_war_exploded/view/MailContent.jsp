<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 18-11-10
  Time: 上午10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyui/css/demo.css">
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../easyui/js/validateExtends.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#contentList").dialog({
                draggable: true,
                fit:true,
                closed:false,
                modal: false,
                noheader: true,
                toolbar:[
                    {
                        text:"删除",
                        plain: true,
                        iconCls:'icon-delete'
                    },
                    {
                        text:"返回",
                        plain:true,
                        iconCls:'icon-delete',
                        handler:function(){
                            $.ajax({
                                url:$(window).attr({
                                    'location':'AcceptMailServlet?method=AcceptMailView'
                                })
                            })
                        }
                    }
                ]
            })
        })
    </script>
</head>
<body>
<div id="contentList">
    <form id="sendList" style="alignment: center">
        <table cellpadding="8" >
            <tr>
                <td>收件人:</td>
                <td>
                    <input id="name" name="name"  class="easyui-textbox"/>
                </td>
            </tr>
            <tr>
                <td>主题:</td>
                <td>
                    <input id="theme" style="width: 800px; height: 30px;" class="easyui-textbox" name="theme"/>
                </td>
            </tr>
            <tr>
                <td>正文:</td>
                <td><textarea id="content" name="content" rows="10000" wrap="hard" style="width:800px;height:600px;" ></textarea></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
