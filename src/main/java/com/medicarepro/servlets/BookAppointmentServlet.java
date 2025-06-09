package com.medicarepro.servlets;

import com.medicarepro.DAO.AppointmentDAO;
import com.medicarepro.DAO.PatientDAO;
import com.medicarepro.DTO.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/BookAppointmentServlet")
public class BookAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String patientQuery = request.getParameter("searchQuery").trim();
            int patientId = new PatientDAO().getPatientIdByNameOrId(patientQuery);

            if (patientId == -1 || patientId == 0) {
                request.setAttribute("message", "Patient not found. Please enter a valid patient name or ID.");
                request.getRequestDispatcher("bookAppointment.jsp").forward(request, response);
                return;
            }

            int doctorId;
            double amount;
            try {
                doctorId = Integer.parseInt(request.getParameter("doctorId").trim());
                amount = Double.parseDouble(request.getParameter("amount").trim());
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid doctor ID or amount.");
                request.getRequestDispatcher("bookAppointment.jsp").forward(request, response);
                return;
            }

            String disease = request.getParameter("disease").trim();
            String dateStr = request.getParameter("date").trim();
            String time = request.getParameter("time").trim();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date appointmentDate = sdf.parse(dateStr);

            Appointment appointment = new Appointment();
            appointment.setPatientId(patientId);
            appointment.setDoctorId(doctorId);
            appointment.setAppointmentDate(appointmentDate);
            appointment.setTimeSlot(time);
            appointment.setConsultationFee(amount);

            AppointmentDAO dao = new AppointmentDAO();

            if (!dao.isDoctorAvailable(doctorId, appointmentDate, time)) {
                request.setAttribute("message",
                        "Doctor already has an appointment at that time. Please choose a different time.");
                request.getRequestDispatcher("bookAppointment.jsp").forward(request, response);
                return;
            }

            boolean success = dao.bookAppointment(appointment);
            if (success) {
                String patientEmail = new PatientDAO().getEmailByPatientId(patientId);
                String patientName = new PatientDAO().getNameByPatientId(patientId);
                String doctorName = dao.getDoctorNameById(doctorId);
                String department = dao.getDoctorDepartmentById(doctorId);

                String subject = "Appointment Confirmation - MediCarePro";
                String content = "Dear " + patientName + ",\n\n" +
                        "We are pleased to confirm your appointment at **MediCarePro Hospital**.\n\n" +
                        "📅 **Appointment Details:**\n" +
                        "--------------------------------------------\n" +
                        "👤 Patient Name   : " + patientName + "\n" +
                        "🆔 Patient ID     : " + patientId + "\n" +
                        "🩺 Doctor         :  " + doctorName + "\n" +
                        "🏥 Department     : " + department + "\n" +
                        "📆 Date           : " + dateStr + "\n" +
                        "⏰ Time           : " + time + "\n" +
                        "💵 Fee            : ₹" + amount + "\n" +
                        "--------------------------------------------\n\n" +
                        "🔔 Please arrive at least 10 minutes before your appointment.\n" +
                        "📍 Location: MediCarePro Hospital, Main Campus\n\n" +
                        "If you have any questions or need to reschedule, contact us at support@medicarepro.com or call 1800-000-123.\n\n" +
                        "Thank you for choosing MediCarePro.\n\n" +
                        "Warm regards,\n" +
                        "MediCarePro Team";

                try {
                    com.medicarepro.utility.EmailUtil.sendEmail(patientEmail, subject, content);
                    request.setAttribute("message", "Appointment successfully booked and confirmation email sent!");
                } catch (Exception ex) {
                    ex.printStackTrace();
                    request.setAttribute("message", "Appointment booked, but failed to send email.");
                }

                // Set success message in session
                HttpSession session = request.getSession();
                session.setAttribute("bookingMessage",
                        "✅ Booking confirmed! Please pay the consultation fee at the hospital reception.");

                // Redirect based on who booked
                if (session.getAttribute("admin") != null) {
                    response.sendRedirect("adminDashboard.jsp");
                } else if (session.getAttribute("patient") != null) {
                    response.sendRedirect("patientDashboard.jsp");
                } else {
                    response.sendRedirect("index.jsp"); // fallback
                }

            } else {
                request.setAttribute("message", "Failed to book appointment. Please try again.");
                request.getRequestDispatcher("bookAppointment.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("bookAppointment.jsp").forward(request, response);
        }
    }
}
