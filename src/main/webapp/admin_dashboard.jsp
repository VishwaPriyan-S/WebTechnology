<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("adminUser") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin.css">
</head>
<body>
  <h2>Welcome, Admin!</h2>
  <a href="LogoutServlet">Logout</a>
  
  <h3>Product Inventory</h3>
  <table border="1">
    <tr>
      <th>ID</th><th>Name</th><th>Price</th><th>Stock</th><th>Action</th>
    </tr>
    <%
      try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ice_cream", "root", "vipvipvp");
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("SELECT * FROM products");
          while (rs.next()) {
    %>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("name") %></td>
      <td><%= rs.getDouble("price") %></td>
      <td><%= rs.getInt("stock") %></td>
      <td>
        <form action="UpdateStockServlet" method="post">
          <input type="hidden" name="productId" value="<%= rs.getInt("id") %>">
          <input type="number" name="stock" min="0" value="<%= rs.getInt("stock") %>">
          <button type="submit">Update</button>
        </form>
      </td>
    </tr>
    <%
          }
          con.close();
      } catch (Exception e) {
          e.printStackTrace();
      }
    %>
  </table>
  <li><a href="http://localhost/icecream_contest/view.php">View Contestants</a></li>
  
  <h2>Feedbacks:</h2>
  <a href="ShowFeedback.jsp">CLICK HERE</a>
</body>
</html>
