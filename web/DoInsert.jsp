<%@ page import="conna.UserPackage" %>
<%@ page import="doa.User" %>
<%@ page import="static com.sun.xml.internal.ws.commons.xmlutil.Converter.UTF_8" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/3/22
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册中</title>
</head>
<body>
<% request.setCharacterEncoding(UTF_8);
%>
<jsp:useBean id="user" class="doa.User">
    <jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<%

    UserPackage userPackage = new UserPackage();
    int rs = userPackage.InsertUser(user);
    if (rs == 1) {
        out.print("注册" + user.getUsername() + "成功");
        response.setHeader("refresh", "3,URL=index.jsp");
    } else {
        out.print("注册失败");
    }
%>
<%--<%--%>
    <%--request.setCharacterEncoding(UTF_8);--%>
    <%--UserPackage userPackage = new UserPackage();--%>
    <%--User user = new User();--%>
    <%--user.setUsername(request.getParameter("username"));--%>
    <%--user.setPassword(request.getParameter("password"));--%>
    <%--user.setType(request.getParameter("type"));--%>
    <%--int rs = userPackage.InsertUser(user);--%>
    <%--if (rs == 1) {--%>
        <%--out.print("注册" + user.getUsername() + "成功");--%>
        <%--response.setHeader("refresh", "3,URL=index.jsp");--%>
    <%--} else {--%>
        <%--out.print("注册失败");--%>
    <%--}--%>
<%--%>--%>

</body>
</html>
