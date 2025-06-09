package com.medicarepro.servlets;

import java.io.IOException;

import com.medicarepro.DAO.AppointmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MarkAppointmentCompletedServlet")
public class MarkAppointmentCompletedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        boolean updated = new AppointmentDAO().markAppointmentCompleted(appointmentId);
        
        if (updated) {
            request.setAttribute("message", "Appointment marked as completed.");
        } else {
            request.setAttribute("message", "Failed to update appointment.");
        }

        request.getRequestDispatcher("viewAppointments.jsp").forward(request, response);
    }
}

