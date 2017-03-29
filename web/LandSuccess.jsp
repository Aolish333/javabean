<%@ page import="static com.sun.xml.internal.ws.commons.xmlutil.Converter.UTF_8" %>
<%@ page import="doa.User" %>
<%@ page import="conna.UserPackage" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="conna.PagingPackage" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/3/28
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>普通用户登陆成功</title>
</head>
<body>
<%
    request.setCharacterEncoding(UTF_8);
    int CurrentPage = 1;
    if (request.getParameter("page")!=null)
    CurrentPage= Integer.parseInt(request.getParameter("page"));
    PagingPackage pagingPackage = new PagingPackage();
    List<User> userList = pagingPackage.PartUser(CurrentPage);
%>
<p>分页查询页面</p>
<form action="" method="post">
    <table border="1">
        <tr>
            <td>id:</td>
            <td>用户</td>
            <td>类型：</td>
        </tr>
        <%
            for (User user:userList){
        %>
        <tr>
            <td><%=user.getId()%></td>
            <td><%=user.getUsername()%></td>
            <td><%=user.getType()%></td>
        </tr>
        <%
            }
        %>
    </table>
    <jsp:include page="DisplayBar.jsp"/>
</form>
</body>
</html>
