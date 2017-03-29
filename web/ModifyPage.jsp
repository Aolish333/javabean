<%@ page import="conna.UserPackage" %>
<%@ page import="static com.sun.xml.internal.ws.commons.xmlutil.Converter.UTF_8" %>
<%@ page import="doa.User" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/3/28
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>修改显示页面</title>
</head>
<body>
<%
    request.setCharacterEncoding(UTF_8);
    User user = new User();
    user.setId(request.getParameter("id"));
    UserPackage userPackage = new UserPackage();
    User user1 = userPackage.SingQuire(user);
%>
<form action="DoModify.jsp" method="post">
    <table>
        <tr>
            <td>用户名：</td>
            <td><input name="username" value="<%=user1.getUsername()%>" type="text"></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input name="username" value="<%=user1.getPassword()%>" type="password"></td>
        </tr>
        <tr>
            <td>确认密码：</td>
            <td><input name="username" value="<%=user1.getPassword()%>" type="password"></td>
        </tr>
        </tr>
        <tr>
            <td>用户类型</td>
            <td><select name="type" check="<%=user1.getType()%>">
                <option></option>
                <option value="普通用户">普通用户</option>
                <option value="管理员">管理员</option>
            </select></td>
        </tr>
        <tr>
            <td><input type="submit" value="提交"></td>
            <td><input type="reset" value="重置"></td>
        </tr>
    </table>
</form>
</body>
</html>
