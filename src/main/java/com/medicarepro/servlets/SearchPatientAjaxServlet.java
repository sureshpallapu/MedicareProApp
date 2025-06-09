package com.medicarepro.servlets;

import com.medicarepro.DAO.PatientDAO;
import com.medicarepro.DTO.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/SearchPatientAjaxServlet")

public class SearchPatientAjaxServlet extends HttpServlet {

	private PatientDAO patientDAO = new PatientDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String query = request.getParameter("query");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		try {
			List<Patient> patients = patientDAO.searchPatients(query);

			StringBuilder json = new StringBuilder("[");
			for (int i = 0; i < patients.size(); i++) {
				Patient p = patients.get(i);
				json.append("{\"id\":").append(p.getId()).append(",\"fullName\":\"").append(p.getFullName())
						.append("\"}");
				if (i < patients.size() - 1)
					json.append(",");
			}
			json.append("]");
			response.getWriter().write(json.toString());

		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().write("[]");
		}
	}
}
