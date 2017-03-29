<%@ page import="doa.User" %>
<%@ page import="conna.UserPackage" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/3/22
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>进行修改</title>
</head>
<body>
<jsp:useBean id="user" class="doa.User">
    <jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<%
    //对数据进行修改
    UserPackage userPackage = new UserPackage();
    int rs = userPackage.Modify(user);
    if (rs == 1) {
        out.print("修改" + user.getUsername() + "成功");
        response.setHeader("refresh", "3,URL=index.jsp");
    } else {
        out.print("修改失败");
    }
%>

</body>
</html>
