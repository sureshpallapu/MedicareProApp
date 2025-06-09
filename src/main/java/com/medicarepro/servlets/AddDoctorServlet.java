package com.medicarepro.servlets;

import com.medicarepro.DAO.DoctorDAO;

import com.medicarepro.DTO.Doctor;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;

@WebServlet("/AddDoctorServlet")
public class AddDoctorServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Doctor doctor = new Doctor();

	    // Set basic doctor information from form
	    doctor.setName(request.getParameter("name"));
	    doctor.setEmail(request.getParameter("email"));
	    doctor.setPhone(request.getParameter("phone"));
	    doctor.setGender(request.getParameter("gender"));
	    doctor.setDepartment(request.getParameter("department"));
	    doctor.setSpecialization(request.getParameter("specialization"));

	    try {
	        doctor.setExperience(Integer.parseInt(request.getParameter("experience")));
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	        response.sendRedirect("manageDoctors?error=InvalidExperience");
	        return;
	    }

	    doctor.setQualification(request.getParameter("qualification"));
	    doctor.setDiseasesDiagnosed(request.getParameter("diseasesDiagnosed"));
	    doctor.setScheduleDays(request.getParameter("scheduleDays"));

	    // Handle time conversion with validation
	    String timeFromStr = request.getParameter("scheduleTimeFrom"); // Expected: "HH:mm"
	    String timeToStr = request.getParameter("scheduleTimeTo");     // Expected: "HH:mm"

	    try {
	        if (timeFromStr != null && timeFromStr.matches("\\d{2}:\\d{2}")) {
	            timeFromStr += ":00"; // Convert to "HH:mm:ss"
	        }
	        if (timeToStr != null && timeToStr.matches("\\d{2}:\\d{2}")) {
	            timeToStr += ":00"; // Convert to "HH:mm:ss"
	        }

	        doctor.setScheduleTimeFrom(Time.valueOf(timeFromStr));
	        doctor.setScheduleTimeTo(Time.valueOf(timeToStr));
	    } catch (IllegalArgumentException e) {
	        e.printStackTrace();
	        response.sendRedirect("manageDoctors?error=InvalidTimeFormat");
	        return;
	    }

	    doctor.setConsultationRoom(request.getParameter("consultationRoom"));
	    doctor.setStatus(request.getParameter("status"));

	    DoctorDAO dao = new DoctorDAO();
		boolean result = dao.addDoctor(doctor);

		// Redirect with success or failure
		response.sendRedirect("manageDoctors.jsp?success=" + result);
	}

}
