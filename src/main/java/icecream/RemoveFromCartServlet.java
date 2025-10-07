package icecream;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
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

        int productId = Integer.parseInt(request.getParameter("productId"));

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "DELETE FROM cart WHERE user_id=? AND product_id=?");
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.executeUpdate();

            // Return updated grand total
            PreparedStatement ps2 = conn.prepareStatement(
                "SELECT SUM(p.price * c.quantity) AS total FROM cart c JOIN products p ON c.product_id=p.id WHERE c.user_id=?");
            ps2.setInt(1, userId);
            ResultSet rs = ps2.executeQuery();
            double grandTotal = 0;
            if (rs.next()) {
                grandTotal = rs.getDouble("total");
            }

            out.print(grandTotal);
        } catch (Exception e) {
            e.printStackTrace();
            out.print("ERROR");
        }
    }
}
