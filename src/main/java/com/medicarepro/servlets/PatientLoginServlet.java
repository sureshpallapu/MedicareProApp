package com.medicarepro.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.medicarepro.DAO.PatientDAO;
import com.medicarepro.DTO.Patient;

@WebServlet("/PatientLoginServlet")
public class PatientLoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		PatientDAO dao = new PatientDAO();
		Patient patient = dao.validateLogin(email, phone);

		if (patient != null) {
			HttpSession session = request.getSession();
			session.setAttribute("patient", patient);
			response.sendRedirect("patientDashboard.jsp");
		} else {
			request.setAttribute("error", "Invalid email or phone.");
			request.getRequestDispatcher("patientLogin.jsp").forward(request, response);
		}
	}
}
