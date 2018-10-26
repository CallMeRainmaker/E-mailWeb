<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 18-10-26
  Time: 下午1:21
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
            $("#sendDialog").dialog({
                fit: true,
                modal: false,
                noheader: true,
                collapsible: false,
                minimizable: false,
                maximizable: false,
                draggable: true,
                closed: false,
                buttons: [
                    {
                        text:'发送',
                        iconCls:'icon-user_add',
                    },
                    {
                        text:'取消',
                        iconCls:'icon-reload',
                    }
                ]
            })

            $("#mail").combobox({
                width: "800",
                height: "30",
                valueField: "id",
                textField: "name",
                panelHeight: "auto",
                multiple: false, //不可多选
                editable: false, //不可编辑
                method: "post",
                url: "ContactorServlet?method=GetUserList"
            })
        })
    </script>
</head>
<body>
<div id="sendDialog" style="padding: 10px">
        <form id="sendList" style="alignment: center">
            <table cellpadding="8" >
                <tr>
                    <td>收件人:</td>
                    <td>
                        <input id="mail" name="mail"  class="easyui-textbox"/>
                    </td>
                </tr>
                <tr>
                    <td>主题:</td>
                    <td>
                        <input id="theme" style="width: 800px; height: 30px;" class="easyui-textbox" name="theme"  />
                    </td>
                </tr>
                <tr>
                    <td>正文:</td>
                    <td><input id="content" style="width: 800px; height: 600px;" class="easyui-textbox" name="content"   /></td>
                </tr>
            </table>
        </form>
</div>
</body>
</html>