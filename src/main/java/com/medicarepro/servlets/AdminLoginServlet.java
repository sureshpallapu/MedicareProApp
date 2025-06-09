package com.medicarepro.servlets;

import com.medicarepro.DAO.AdminDAO;


import com.medicarepro.DTO.AdminDTO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		AdminDAO adminDAO = new AdminDAO();
		AdminDTO admin = adminDAO.getAdminByCredentials(username, password);

		if (admin != null) {
			// Login success - Set session attribute
			HttpSession session = request.getSession();
			session.setAttribute("adminUser", admin);

			// Redirect to admin dashboard
			response.sendRedirect("adminDashboard.jsp");
		} else {
			// Invalid credentials - Redirect back with error message
			response.sendRedirect("login.jsp?error=Invalid credentials");
		}
	}
}
