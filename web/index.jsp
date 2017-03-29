<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/3/19
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>$Title$</title>
</head>
<body>
<form action="DoLogin.jsp" method="post">
    <table>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="username" value=""></td>
            <td>密码：</td>
            <td><input type="password" name="password" value=""></td>
            <td><select name="type">
                <option value="普通用户">普通用户</option>
                <option value="管理员">管理员</option>
            </select></td>
            <td><input type="submit" value="提交"></td>
        </tr>
    </table>
    <a href="InSert.jsp">注册页面</a>
</form>
</body>
</html>
