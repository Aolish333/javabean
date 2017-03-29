<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/3/22
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>用户注册</title>
    <script type="text/javascript">
        function check() {
            var username = register.username.value;
            var password = register.password.value;
            var repassword = register.repassword.value;
            if (username == "") {
                alert("用户名不能为空");
                register.username.focus();
                register.username.select();
                return false;
            } else if (password == "") {
                alert("密码不能为空");
                register.password.focus();
                register.password.select();
                return false;
            } else if (password.length < 6) {
                alert("密码不能小于6位");
                register.password.focus();
                register.password.select();
                return false;
            } else if (password != repassword) {
                alert("两次密码不一致");
                register.repassword.focus();
                register.repassword.select();
                return false;
            }
        }
    </script>
</head>
<body>
<form accept-charset="UTF-8" action="DoInsert.jsp" name="register" method="post" onsubmit="return check(this)">
    <table>
        <tr align="center">
            <td>账号：</td>
            <td><input name="username" type="text" value=""></td>
        </tr>
        <tr align="center">
            <td>密码：</td>
            <td><input name="password" type="password" value=""></td>
        </tr>
        <tr align="center">
            <td>再次输入：</td>
            <td><input name="repassword" type="password" value=""></td>
        </tr>
        <tr>
            <td>权限：</td>
            <td>
                <select name="type">
                    <option value="管理员">管理员</option>
                    <option value="普通用户">普通用户</option>
                </select>
            </td>
        </tr>
        <tr align="center">
            <td><input type="submit" name="sub"></td>
            <td><input type="reset" name="re"></td>
        </tr>
    </table>
</form>
</body>
</html>
