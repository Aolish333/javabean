<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/3/14
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@page import="conna.Conn" %>
<%@page import="conna.UserPackage" %>
<%@page import="doa.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.sun.xml.internal.ws.commons.xmlutil.Converter.UTF_8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示页面</title>
</head>
<body>
<form action="" method="post">
    <table border="2dp">
        <tr>
            <td>用户信息</td>
        </tr>
        <tr>
            <td>Id</td>
            <td>用户名</td>
            <td>密码</td>
            <td>权限</td>
            <td>修改</td>
            <td>删除</td>
        </tr>
        <%
            request.setCharacterEncoding(UTF_8);
            User user;
            List<User> userList;
            UserPackage up = new UserPackage();
             userList = up.Inquire();
            Iterator<User> iterator = userList.iterator();
            while (iterator.hasNext()) {
                user = iterator.next();
        %>
        <tr>
            <td>
                <%= user.getId()%>
            </td>
            <td>
                <%= user.getUsername()%>
            </td>
            <td>
                <%= user.getUsername()%>
            </td>
            <td>
                <%= user.getType()%>
            </td>
            <td>
                <a href="ModifyPage.jsp?id=<%=user.getId()%>">修改</a>
            </td>
            <td>
                <a href="DoDelete.jsp?id=<%=user.getId()%>">删除</a>
            </td>
        </tr>
        <%
            }
        %>

    </table>

</form>
</body>
</html>
