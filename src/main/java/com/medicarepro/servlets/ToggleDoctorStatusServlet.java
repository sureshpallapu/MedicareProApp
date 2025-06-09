package com.medicarepro.servlets;

import com.medicarepro.DAO.DoctorDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ToggleDoctorStatusServlet")
public class ToggleDoctorStatusServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String doctorIdParam = request.getParameter("id");
		if (doctorIdParam == null || doctorIdParam.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing doctor ID");
			return;
		}

		int doctorId;
		try {
			doctorId = Integer.parseInt(doctorIdParam);
		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid doctor ID format");
			return;
		}

		try {
			DoctorDAO dao = new DoctorDAO();
			dao.toggleDoctorStatus(doctorId);

			// Redirect back to the manageDoctors.jsp page
			response.sendRedirect("AllDoctorsServlet");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
					"Database error while toggling doctor status");
		}
	}
}
