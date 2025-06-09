package com.medicarepro.servlets;

import com.medicarepro.DAO.AppointmentDAO;

import com.medicarepro.DAO.PatientDAO;
import com.medicarepro.DAO.DoctorDAO;
import com.medicarepro.DTO.Appointment;
import com.medicarepro.DTO.Patient;
import com.medicarepro.DTO.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/ViewAppointmentsServlet")
public class ViewAppointmentsServlet extends HttpServlet  {

    private AppointmentDAO appointmentDAO = new AppointmentDAO();
    private PatientDAO patientDAO = new PatientDAO();
    private DoctorDAO doctorDAO = new DoctorDAO();

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Appointment> appointments = appointmentDAO.getAllAppointments();

		// Fetch patient and doctor details for each appointment for display
		List<Map<String, Object>> appointmentDetails = new ArrayList<>();
		for (Appointment app : appointments) {
		    Map<String, Object> map = new HashMap<>();
		    map.put("appointment", app);

		    Patient p = patientDAO.getPatientById(app.getPatientId());
		    Doctor d = doctorDAO.getDoctorById(app.getDoctorId());
		    map.put("patient", p);
		    map.put("doctor", d);

		    appointmentDetails.add(map);
		}

		request.setAttribute("appointmentDetails", appointmentDetails);
		request.getRequestDispatcher("admin-appointment.jsp").forward(request, response);
    }
}
