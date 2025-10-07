<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>IceCream Heaven</title>
  <link rel="stylesheet" href="style.css" />
  <link rel="icon" type="image/png" href="images/ice-cream.png">
	
</head>
<body>
  <header>
    <nav class="navbar">
      <h1 class="logo">IceCream Heaven</h1>
      <ul class="nav-links">
      <li><a href="admin_login.jsp">Admin</a></li>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="menu.jsp">Menu</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
        <%
          Integer userId = (Integer) session.getAttribute("userId");
          if (userId == null) {
        %>
          <li><a href="login.jsp">Login</a></li>
          <li><a href="register.jsp">Register</a></li>
        <%
          } else {
        %>
          <li><a href="LogoutServlet">Logout</a></li>
        <%
          }
        %>
      </ul>
    </nav>
  </header>

  <h1 style="text-align: center; color: azure;">Welcome to the Sweetest Place!</h1>
  <br />
  <h3 style="text-align: center; color: azure;">Discover flavors that melt your heart</h3>
  
  <section class="hero">
    <a href="menu.jsp" class="btn">See Our Menu</a>
  </section>

  <section class="featured">
    <h2>Our Best Sellers</h2>
    <div class="cards">
      <div class="card">
        <img src="images/chocolate.jpg" alt="Chocolate Ice Cream" />
        <h3>Chocolate Bliss</h3>
      </div>
      <div class="card">
        <img src="images/strawberry.jpg" alt="Strawberry Ice Cream" />
        <h3>Strawberry Dream</h3>
      </div>
      <div class="card">
        <img src="images/vanilla.jpg" alt="Vanilla Ice Cream" />
        <h3>Classic Vanilla</h3>
      </div>
    </div>
  </section>
<li><a href="http://localhost/icecream_contest/register.php">Contest Registration</a></li>

  <footer>
    <p>IceCream Heaven | Made with Love</p>
  </footer>

  <script src="script.js"></script>
</body>
</html>
