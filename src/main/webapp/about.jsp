<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IceCream Heaven | About</title>
  <link rel="stylesheet" href="style.css">
   <link rel="icon" type="image/png" href="images/ice-cream.png">
</head>
<body>
  <header>
   <nav class="navbar">
      <h1 class="logo">IceCream Heaven</h1>
      <ul class="nav-links">
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

  <section class="about-page">
    <h1>About Us</h1>
    <p>
      Since 2010, IceCream Heaven has been serving smiles with every scoop.  
      We believe in fresh ingredients, creative flavors, and happy customers.  
      Our passion is to make ice cream that warms your heart while cooling your taste buds!
    </p>
    <h1>BACK IN 1990's in Townhall Coimbatore:</h1>
    <img src="images/store.jpg" alt="Our Store" style="height: 700px; width: 700px;">
    <h2>OUR LEGENDARY ICE-CREAM CART</h2>
    <p>
      Our journey began with a humble ice-cream cart in the bustling streets of Townhall, Coimbatore.  
      With just a few flavors and a lot of heart, we quickly became a local favorite.  
      Today, we honor our roots by continuing to serve the community with the same dedication and love for ice cream.
    </p>
    <h1>After we built our own shop:</h1>
    <img src="images/store1.jpg" alt="Our Store" style="height: 700px; width: 700px;">
    <h2>OUR store</h2>
    <p>
      From our first scoop to our latest creation, every moment has been a step towards making IceCream Heaven a beloved destination.  
      We invite you to be part of our story and create sweet memories with us!
    </p>
  </section>
  

  <footer>
    <p>IceCream Heaven | A scoop above the rest</p>
  </footer>
</body>
</html>
