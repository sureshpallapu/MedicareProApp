package com.medicarepro.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.medicarepro.utility.DBConnector;

@WebServlet("/EditUpdateStaffServlet")
public class EditUpdateStaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("staffId"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String dept = request.getParameter("department");
        String qual = request.getParameter("qualification");
        String exp = request.getParameter("experience");
        String shift = request.getParameter("shift");
        String status = request.getParameter("status");

        try (Connection con = DBConnector.getConnection()) {
            String sql = "UPDATE staff SET name=?, phone=?, email=?, department=?, qualification=?, experience=?, shift=?, status=? WHERE staffId=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, dept);
            ps.setString(5, qual);
            ps.setString(6, exp);
            ps.setString(7, shift);
            ps.setString(8, status);
            ps.setInt(9, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("manageStaff.jsp");
    }
}
