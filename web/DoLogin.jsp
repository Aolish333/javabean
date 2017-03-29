<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/3/19
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@page import="doa.User" %>
<%@ page import="conna.UserPackage" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="static com.sun.xml.internal.ws.commons.xmlutil.Converter.UTF_8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"]]>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding(UTF_8);
%>
<jsp:useBean id="user" class="doa.User"  >
    <jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<%--类型：<jsp:getProperty name="user" property="type"></jsp:getProperty>--%>
<%
    UserPackage userPackage = new UserPackage();
    ResultSet resultSet = userPackage.DoLogin(user);
    if (resultSet != null){
        out.print(user.getType());
        if(user.getType().equals("普通用户")){
            out.print("登陆"+user.getUsername()+"成功...");
            response.setHeader("refresh","3,URL=LandSuccess.jsp");
        }else{
            out.print("登陆"+user.getUsername()+"成功");
            response.setHeader("refresh","3,URL=ShowPage.jsp");
        }
    }else {
        out.print("用户名或密码错误。");
    }
%>

</body>
</html>
