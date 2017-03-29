<%@ page import="conna.UserPackage" %>
<%@ page import="doa.User" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/3/22
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>进行删除</title>
</head>
<body>
<%
    int flag;
    String id = request.getParameter("id");
    System.out.printf(id);
    User user = new User();
    user.setId(id);
    UserPackage userPackage = new UserPackage();
    flag = userPackage.DeleteUser(user);
    if (flag==1) {
        out.print("删除成功！");
        response.setHeader("refresh","2,URL=ShowPage.jsp");
    }else {
        System.out.println("失败");
        response.setHeader("refresh","3,URL=ShowPage.jsp");
    }
%>
</body>
</html>
