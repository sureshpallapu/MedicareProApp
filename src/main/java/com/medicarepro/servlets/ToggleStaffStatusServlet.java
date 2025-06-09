package com.medicarepro.servlets;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.medicarepro.utility.DBConnector;

@WebServlet("/ToggleStaffStatusServlet")
public class ToggleStaffStatusServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int staffId = Integer.parseInt(request.getParameter("staffId"));
		String currentStatus = request.getParameter("currentStatus");

		String newStatus = currentStatus.equals("Active") ? "Inactive" : "Active";

		try (Connection con = DBConnector.getConnection()) {
			PreparedStatement stmt = con.prepareStatement("UPDATE staff SET status = ? WHERE staffId = ?");
			stmt.setString(1, newStatus);
			stmt.setInt(2, staffId);
			int updated = stmt.executeUpdate();

			if (updated > 0) {
				response.sendRedirect("manageStaff.jsp");
			} else {
				response.getWriter().println("Failed to update status.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}
}
