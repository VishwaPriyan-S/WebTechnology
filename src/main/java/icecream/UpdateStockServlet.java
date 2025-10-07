package icecream;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/UpdateStockServlet")
public class UpdateStockServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        int productId = Integer.parseInt(request.getParameter("productId"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ice_cream", "root", "vipvipvp");
            
            PreparedStatement ps = con.prepareStatement("UPDATE products SET stock=? WHERE id=?");
            ps.setInt(1, stock);
            ps.setInt(2, productId);
            ps.executeUpdate();
            
            con.close();
            response.sendRedirect("admin_dashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
