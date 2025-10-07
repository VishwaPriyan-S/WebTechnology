package icecream;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain"); 
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            out.print("NOT_LOGGED_IN");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);

            PreparedStatement ps1 = conn.prepareStatement(
                "SELECT product_id, quantity FROM cart WHERE user_id=?");
            ps1.setInt(1, userId);
            ResultSet rs = ps1.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int qty = rs.getInt("quantity");

                PreparedStatement ps2 = conn.prepareStatement(
                    "UPDATE products SET stock = stock - ? WHERE id=? AND stock >= ?");
                ps2.setInt(1, qty);
                ps2.setInt(2, productId);
                ps2.setInt(3, qty);
                int updated = ps2.executeUpdate();

                if (updated == 0) {
                    conn.rollback();
                    out.print("OUT_OF_STOCK");
                    return;
                }
            }

            PreparedStatement ps3 = conn.prepareStatement(
                "DELETE FROM cart WHERE user_id=?");
            ps3.setInt(1, userId);
            ps3.executeUpdate();

            conn.commit();
            out.print("ORDER_PLACED");
        } catch (Exception e) {
            e.printStackTrace();
            out.print("ERROR");
        }
    }
}
