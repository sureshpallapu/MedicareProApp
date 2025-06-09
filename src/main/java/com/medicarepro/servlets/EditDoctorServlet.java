package com.medicarepro.servlets;

import com.medicarepro.DAO.DoctorDAO;

import com.medicarepro.DTO.Doctor;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;

@WebServlet("/EditDoctorServlet")
public class EditDoctorServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DoctorDAO dao = null;
		dao = new DoctorDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		Doctor doctor = dao.getDoctorById(id);

		if (doctor != null) {
			doctor.setName(request.getParameter("name"));
			doctor.setGender(request.getParameter("gender"));
			doctor.setDepartment(request.getParameter("department"));
			doctor.setSpecialization(request.getParameter("specialization"));
			doctor.setExperience(Integer.parseInt(request.getParameter("experience")));
			doctor.setQualification(request.getParameter("qualification"));
			doctor.setDiseasesDiagnosed(request.getParameter("diseasesDiagnosed"));
			doctor.setScheduleDays(request.getParameter("scheduleDays"));
			doctor.setScheduleTimeFrom(Time.valueOf(request.getParameter("scheduleTimeFrom")));
			doctor.setScheduleTimeTo(Time.valueOf(request.getParameter("scheduleTimeTo")));
			doctor.setConsultationRoom(request.getParameter("consultationRoom"));
			doctor.setStatus(request.getParameter("status"));

			boolean result = dao.updateDoctor(doctor);
			response.sendRedirect("manageDoctors.jsp?updated=" + result);
		} else {
			response.sendRedirect("manageDoctors.jsp?updated=false");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		DoctorDAO dao = new DoctorDAO();
		Doctor doctor = dao.getDoctorById(id);
		if (doctor != null) {
			request.setAttribute("doctor", doctor);
			// Forward to JSP form to edit doctor details
			RequestDispatcher rd = request.getRequestDispatcher("EditDoctor.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("manageDoctors.jsp?error=notfound");
		}
	}

}
