package com.medicarepro.servlets;

import com.medicarepro.DAO.DoctorDAO;

import com.medicarepro.DTO.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DoctorLoginServlet")
public class DoctorLoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// Basic validation
		if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
			response.sendRedirect("doctorLogin.jsp?error=Please+enter+both+email+and+password");
			return;
		}

		try {
			DoctorDAO dao = new DoctorDAO();

			// Assuming DoctorDAO has a method to validate login:
			Doctor doctor = dao.loginDoctor(email, password);

			if (doctor != null) {
				// Login success: create session and redirect to doctor dashboard or homepage
				HttpSession session = request.getSession();
				session.setAttribute("doctor", doctor);
				response.sendRedirect("doctorDashboard.jsp");
			} else {
				// Login failed
				response.sendRedirect("doctorLogin.jsp?error=Invalid+email+or+password");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("doctorLogin.jsp?error=Server+error,+please+try+again");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("doctorLogin.jsp");
	}
}
