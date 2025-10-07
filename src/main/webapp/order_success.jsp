<%@ page import="java.util.UUID" %>
<%@ page import="java.sql.*" %>
<%@ page import="icecream.DBConnection" %> 

<%
    String orderId = "ORD-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();

    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    try {
        
        con = DBConnection.getConnection();

        String sql = "INSERT INTO orders (order_id, userId, order_date) VALUES (?, ?, NOW())";
        ps = con.prepareStatement(sql);
        ps.setString(1, orderId);
        ps.setInt(2, userId);
        ps.executeUpdate();

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) try { ps.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Order Success</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }
        .card { display: inline-block; padding: 20px; border: 1px solid #ccc; border-radius: 10px; }
        .order-id { font-size: 20px; font-weight: bold; color: green; }
        
    </style>
    <link rel="stylesheet" href="style.css">
     <link rel="icon" type="image/png" href="images/ice-cream.png">
</head>
<body>
    <div class="card">
        <h2>Order Placed Successfully!</h2>
        <p>Your unique Order ID:</p>
        <p class="order-id"><%= orderId %></p>
        <p>Show this Order ID to the delivery boy.</p>
        <a href="index.jsp">Continue Shopping</a>
    </div>
</body>
</html>
