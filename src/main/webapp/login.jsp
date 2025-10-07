<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login | IceCream Heaven</title>
    <link rel="stylesheet" href="style.css">
     <link rel="icon" type="image/png" href="images/ice-cream.png">
</head>
<body>
    <h1 style="text-align:center; font-family:'Trebuchet MS';">Login</h1>
    <form action="LOGIN" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required /><br>
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required /><br>
        <button id="loginButton" type="submit">Login</button>
    </form>
    <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    <%
        String error = request.getParameter("error");
        if ("1".equals(error)) {
    %>
        <p style="color: red;">Invalid Username or password.</p>
    <%
        }
    %>
</body>
</html>
