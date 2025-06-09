package com.medicarepro.servlets;

import com.medicarepro.DAO.AppointmentDAO;
import com.medicarepro.DTO.Appointment;
import com.medicarepro.DTO.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DoctorAppointmentsServlet")
public class DoctorAppointmentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Doctor doctor = (Doctor) session.getAttribute("doctor");

        if (doctor == null) {
            response.sendRedirect("doctorLogin.jsp");
            return;
        }

        int doctorId = doctor.getId();
        List<Appointment> appointments = new AppointmentDAO().getAppointmentsByDoctorId(doctorId);
        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("viewAppointments.jsp").forward(request, response);
    }
}
