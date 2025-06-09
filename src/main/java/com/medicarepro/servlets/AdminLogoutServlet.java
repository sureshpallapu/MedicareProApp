package com.medicarepro.servlets;

import jakarta.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Invalidate the session
		HttpSession session = request.getSession(false); // get existing session, don't create new
		if (session != null) {
			session.invalidate();
		}

		// Redirect to login page
		response.sendRedirect("adminlogin.jsp");
	}
}
