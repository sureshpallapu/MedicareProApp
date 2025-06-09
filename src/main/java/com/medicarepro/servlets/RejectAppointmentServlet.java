package com.medicarepro.servlets;

import java.io.IOException;

import com.medicarepro.DAO.AppointmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/rejectAppointment")
public class RejectAppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int appointmentId = Integer.parseInt(request.getParameter("id"));

        boolean isUpdated = AppointmentDAO.updateAppointmentStatus(appointmentId, "Rejected");

        if (isUpdated) {
            request.getSession().setAttribute("successMessage", "Appointment Rejected.");
        } else {
            request.getSession().setAttribute("errorMessage", "Failed to reject appointment.");
        }

        response.sendRedirect("viewAppointments.jsp"); // Adjust the path
    }
}
