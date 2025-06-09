package com.medicarepro.servlets;

import com.medicarepro.DAO.DoctorDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteDoctorServlet")
public class DeleteDoctorServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		DoctorDAO dao = null;
		dao = new DoctorDAO();
		boolean result = dao.deleteDoctor(id);
		response.sendRedirect("ManageDocors.jsp?deleted=" + result);
	}
}