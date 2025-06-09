package com.medicarepro.servlets;



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.medicarepro.utility.DBConnector;

@WebServlet("/DeleteStaffServlet")
public class DeleteStaffServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int staffId = Integer.parseInt(request.getParameter("id"));

        try (Connection con = DBConnector.getConnection()) {
            String sql = "DELETE FROM staff WHERE staffId=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, staffId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("manageStaff.jsp");
    }
}
