package com.medicarepro.servlets;

import com.medicarepro.DTO.Appointment;
import com.medicarepro.DAO.AppointmentDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class PatientAppointmentsServlet extends HttpServlet {

    private AppointmentDAO appointmentService = new AppointmentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // For example, patient ID might come from session after login
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("patientId") == null) {
            response.sendRedirect("login.jsp");  // redirect if not logged in
            return;
        }

        int patientId = (Integer) session.getAttribute("patientId");

        // Fetch appointments for this patient
        List<Appointment> appointments = appointmentService.getAppointmentsForPatient(patientId);

        // Set appointments as request attribute
        request.setAttribute("appointments", appointments);

        // Forward to JSP page
        RequestDispatcher rd = request.getRequestDispatcher("appointments.jsp");
        rd.forward(request, response);
    }
}

