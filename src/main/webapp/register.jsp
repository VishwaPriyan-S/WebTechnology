<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register | IceCream Heaven</title>
    <link rel="stylesheet" href="style.css">
     <link rel="icon" type="image/png" href="images/ice-cream.png">
</head>
<body>
    <h1 style="text-align:center; font-family:'Trebuchet MS';">Register</h1>
    <form action="register" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required /><br>
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required /><br>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login here</a></p>
    <%
        String error = request.getParameter("error");
        String success = request.getParameter("success");
        if ("1".equals(error)) {
    %>
        <p style="color: red;">Username already exists. Please choose another.</p>
    <%
        }
        if ("1".equals(success)) {
    %>
        <p style="color: green;">Registration successful! Please <a href="login.jsp">login</a>.</p>
    <%
        }
    %>
</body>
</html>
