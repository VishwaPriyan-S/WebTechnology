package icecream;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
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
                "INSERT INTO cart(user_id, product_id, quantity) VALUES(?,?,1) " +
                "ON DUPLICATE KEY UPDATE quantity = quantity + 1");
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.executeUpdate();
            response.sendRedirect("cart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            out.print("ERROR");
        }
    }
}
