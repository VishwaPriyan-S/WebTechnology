<%@ page import="java.sql.*" %>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ice_cream", "root", "vipvipvp");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM products");
%>
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
<section class="menu-page">
  <h2>Our Menu</h2>
  <div class="cards">
    <%
      while (rs.next()) {
        int stock = rs.getInt("stock");
    %>
    <div class="card">
      <img src="<%= rs.getString("img_path") %>" alt="<%= rs.getString("name") %>">
      <h3><%= rs.getString("name") %></h3>
      <p>$<%= rs.getDouble("price") %></p>
      <p><b>In Stock: <%= stock %></b></p>

      <form action="AddToCartServlet" method="post">
        <input id="add" type="hidden" name="productId" value="<%= rs.getInt("id") %>" />
        <button type="submit" <%= (stock <= 0 ? "disabled" : "") %>>Add to Cart</button>
      </form>
    </div>
    <% } %>
  </div>

  
</section>

<%
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>