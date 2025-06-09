package com.medicarepro.servlets;

import java.io.IOException;

import com.medicarepro.DAO.AppointmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/approveAppointment")
public class ApproveAppointmentServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int appointmentId = Integer.parseInt(request.getParameter("id"));

		boolean isUpdated = AppointmentDAO.updateAppointmentStatus(appointmentId, "Approved");

		if (isUpdated) {
			request.getSession().setAttribute("successMessage", "Appointment Approved Successfully.");
		} else {
			request.getSession().setAttribute("errorMessage", "Failed to approve appointment.");
		}

		response.sendRedirect("viewAppointments.jsp"); // Change path as needed
	}
}
