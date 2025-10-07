package icecream;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ice_cream", "root", "vipvipvp");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM admins WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminUser", username);
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                response.sendRedirect("admin_login.jsp?error=1");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
