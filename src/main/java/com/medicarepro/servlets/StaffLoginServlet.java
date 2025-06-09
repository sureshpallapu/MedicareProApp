package com.medicarepro.servlets;

import com.medicarepro.DAO.StaffDAO;
import com.medicarepro.DTO.Staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/StaffLoginServlet")
public class StaffLoginServlet extends HttpServlet {

	private StaffDAO staffDAO;

	@Override
	public void init() {
		try {
			staffDAO = new StaffDAO();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String phone = request.getParameter("password");
		String remember = request.getParameter("remember");

		Staff staff = staffDAO.login(email, phone);

		if (staff != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loggedInStaff", staff);

			if ("on".equals(remember)) {
				Cookie emailCookie = new Cookie("staffEmail", email);
				emailCookie.setMaxAge(7 * 24 * 60 * 60); // 1 week
				response.addCookie(emailCookie);
			}

			response.sendRedirect("staff_dashboard.jsp");
		} else {
			request.setAttribute("error", "Invalid email or password.");
			request.getRequestDispatcher("staffLogin.jsp").forward(request, response);
		}
	}
}
