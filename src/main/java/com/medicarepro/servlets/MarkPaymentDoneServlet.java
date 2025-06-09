package com.medicarepro.servlets;

import com.medicarepro.utility.DBConnector;
import com.medicarepro.utility.MailSender;

import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/markPaymentDone")
public class MarkPaymentDoneServlet extends HttpServlet {

	@Override
	public void init() throws ServletException {
		System.out.println(">>> MarkPaymentDoneServlet initialized successfully");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String appointmentIdStr = request.getParameter("appointmentId");
		String transactionId = request.getParameter("transactionId");

		if (appointmentIdStr == null || appointmentIdStr.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Appointment ID is required.");
			return;
		}

		try {
			int appointmentId = Integer.parseInt(appointmentIdStr);
			String patientEmail = null;
			String patientName = null;
			int patientId = 0;
			double amount = 0.0;

			try (Connection con = DBConnector.getConnection()) {

				// Fetch patient_id, amount, email, and full_name from appointments + patients
				String patientInfoSql = "SELECT a.patient_id, a.consultation_fee, p.email, p.full_name "
				        + "FROM appointments a JOIN patients p ON a.patient_id = p.id WHERE a.id = ?";
				PreparedStatement patientInfoStmt = con.prepareStatement(patientInfoSql);
				patientInfoStmt.setInt(1, appointmentId);
				ResultSet patientInfoRs = patientInfoStmt.executeQuery();

				if (patientInfoRs.next()) {
				    patientId = patientInfoRs.getInt("patient_id");
				    amount = patientInfoRs.getDouble("consultation_fee");  // <-- use consultation_fee here
				    patientEmail = patientInfoRs.getString("email");
				    patientName = patientInfoRs.getString("full_name");
				} else {
				    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Appointment ID.");
				    return;
				}


				// Check if payment exists for appointment
				String checkSql = "SELECT id FROM payments WHERE appointment_id = ?";
				PreparedStatement checkStmt = con.prepareStatement(checkSql);
				checkStmt.setInt(1, appointmentId);
				ResultSet rs = checkStmt.executeQuery();

				if (rs.next()) {
					// Update existing payment
					String updateSql = "UPDATE payments SET status = ?, reference_id = ?, payment_date = NOW() WHERE appointment_id = ?";
					PreparedStatement updateStmt = con.prepareStatement(updateSql);
					updateStmt.setString(1, "PAID");
					updateStmt.setString(2, transactionId);
					updateStmt.setInt(3, appointmentId);
					updateStmt.executeUpdate();
				} else {
					// Insert new payment record with required fields
					String insertSql = "INSERT INTO payments (appointment_id, patient_id, amount, status, reference_id, payment_date) "
							+ "VALUES (?, ?, ?, ?, ?, NOW())";
					PreparedStatement insertStmt = con.prepareStatement(insertSql);
					insertStmt.setInt(1, appointmentId);
					insertStmt.setInt(2, patientId);
					insertStmt.setDouble(3, amount);
					insertStmt.setString(4, "PAID");
					insertStmt.setString(5, transactionId);
					insertStmt.executeUpdate();
				}
			}

			// Send confirmation email
			if (patientEmail != null) {
				String subject = "Payment Confirmation - MediCarePro";
				String messageText = "Dear " + patientName + ",\n\n"
						+ "We have received your payment for appointment ID: " + appointmentId + ".\n"
						+ "Thank you for choosing MediCarePro.\n\n" + "Regards,\nMediCarePro Team";

				try {
					MailSender.sendEmail(patientEmail, subject, messageText);
				} catch (MessagingException me) {
					me.printStackTrace();
				}
			}

			// Redirect on success
			response.sendRedirect("payment_success.jsp?appointmentId=" + appointmentId);

		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Appointment ID.");
		} catch (SQLException e) {
			throw new ServletException("Database error while marking payment", e);
		}
	}
}
