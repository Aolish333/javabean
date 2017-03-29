<%@ page import="conna.PagingPackage" %>
<%@ page import="java.util.List" %>
<%@ page import="doa.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.sun.xml.internal.ws.commons.xmlutil.Converter.UTF_8" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/3/28
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding(UTF_8);

    int PerPage = User.PAGES_PER;
    int CurrentPage = 1;//当前页数
    int pages;//总共的页数

    if (request.getParameter("page") != null) {
        CurrentPage = Integer.parseInt(request.getParameter("page"));
    }
    PagingPackage pagingPackage = new PagingPackage();
    int CountsAll = pagingPackage.CountsAll();//全部的条目数。
//    List<User> list = new ArrayList<>();
//    list = pagingPackage.PartUser(CurrentPage);
    StringBuffer BarList = new StringBuffer();
    if (CountsAll % PerPage == 0) {
        pages = CountsAll / PerPage;
    } else {
        pages = CountsAll / PerPage + 1;
    }
    for (int i = 1; i <= pages; i++) {
        if (i == CurrentPage) {
            BarList.append(i);
        } else {
            BarList.append("<a href=\"LandSuccess.jsp?page="+i+"\">"+i+"</a>");
        }
        BarList.append(" ");
    }
    out.print(BarList);
%>
</body>
</html>
