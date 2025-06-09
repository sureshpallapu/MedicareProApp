package com.medicarepro.servlets;



import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/logout")
public class DoctorLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false); // Get session if exists
		if (session != null) {
			session.invalidate(); // Invalidate the session
		}
		response.sendRedirect("doctorLogin.jsp"); // Redirect to login page
	}
}

