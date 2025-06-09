package com.medicarepro.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.medicarepro.DAO.StaffDAO;
import com.medicarepro.DTO.Staff;
import com.medicarepro.utility.DBConnector;

@WebServlet("/AddStaffServlet")
public class AddStaffServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String department = request.getParameter("department");
		String qualification = request.getParameter("qualification");
		String experience = request.getParameter("experience");
		String shift = request.getParameter("shift");
		String status = request.getParameter("status");

		if (name == null || phone == null || email == null || department == null || qualification == null
				|| experience == null || shift == null || status == null || name.isEmpty() || phone.isEmpty()
				|| email.isEmpty()) {
			request.setAttribute("errorMessage", "All fields are required!");
			request.getRequestDispatcher("AddStaff.jsp").forward(request, response);
			return;
		}

		try (Connection con = DBConnector.getConnection()) {
			String sql = "INSERT INTO staff (name, phone, email, department, qualification, experience, shift, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, name);
			ps.setString(2, phone);
			ps.setString(3, email);
			ps.setString(4, department);
			ps.setString(5, qualification);
			ps.setString(6, experience);
			ps.setString(7, shift);
			ps.setString(8, status);

			int rows = ps.executeUpdate();
			if (rows > 0) {
				response.sendRedirect("manageStaff.jsp?msg=Staff added successfully");
			} else {
				response.sendRedirect("manageStaff.jsp?msg=Failed to add staff");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("manageStaff.jsp?msg=Error: " + e.getMessage());
		}
	}
}
