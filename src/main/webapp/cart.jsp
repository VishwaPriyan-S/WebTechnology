<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="icecream.DBConnection" %>

<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Your Cart</title>
  <link rel="stylesheet" href="cart.css">
  <link rel="icon" type="image/png" href="images/ice-cream.png">

  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>Your Cart</h2>

<table id="cartTable" border="1" cellpadding="10" cellspacing="0">
<tr><th>Product</th><th>Quantity</th><th>Price</th><th>Total</th><th>Action</th></tr>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
              "SELECT p.id, p.name, p.price, c.quantity FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            double grandTotal = 0;
            while (rs.next()) {
                int pid = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                double total = price * quantity;
                grandTotal += total;
%>
<tr id="row-<%= pid %>">
    <td><%= name %></td>
    <td><%= quantity %></td>
    <td>$<%= price %></td>
    <td class="itemTotal">$<%= total %></td>
    <td>
        <button class="removeBtn" data-id="<%= pid %>">Remove</button>
    </td>
</tr>
<%
            }
%>
<tr id="grandRow">
  <td colspan="3" align="right"><strong>Grand Total:</strong></td>
  <td colspan="2" id="grandTotal">$<%= grandTotal %></td>
</tr>
</table>

<button id="placeOrderBtn">Place Order</button>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<script>
$(document).ready(function() {
  
  
  $(".removeBtn").click(function() {
    let pid = $(this).data("id");

    $.ajax({
      url: "RemoveFromCartServlet",
      type: "POST",
      data: { productId: pid },
      success: function(response) {
 
        $("#row-" + pid).remove();
       
        $("#grandTotal").text(response);
      },
      error: function(xhr, status, error) {
        alert("Error removing item: " + error);
      }
    });
  });

  
  $("#placeOrderBtn").click(function() {
    $.ajax({
      url: "PlaceOrderServlet",
      type: "POST",
      success: function(response) {
        alert(response); 
        $("#cartTable").html("<tr><td colspan='5'>Cart is empty</td></tr>");
      },
      error: function(xhr, status, error) {
        alert("Error placing order: " + error);
      }
    });
  });

});
</script>
</body>
</html>
