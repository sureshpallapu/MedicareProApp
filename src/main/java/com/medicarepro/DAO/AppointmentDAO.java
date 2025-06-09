package com.medicarepro.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.medicarepro.DTO.Appointment;
import com.medicarepro.utility.DBConnector;

public class AppointmentDAO {

	public boolean bookAppointment(Appointment app) {
		String sql = "INSERT INTO appointments (patient_id, doctor_id, appointment_date, time_slot, consultation_fee) VALUES (?, ?, ?, ?, ?)";
		try (Connection con = DBConnector.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, app.getPatientId());
			ps.setInt(2, app.getDoctorId());
			ps.setDate(3, new java.sql.Date(app.getAppointmentDate().getTime()));
			ps.setString(4, app.getTimeSlot());
			ps.setDouble(5, app.getConsultationFee());

			int rows = ps.executeUpdate();
			return rows > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Appointment> getAllAppointments() {
		List<Appointment> list = new ArrayList<>();
		String sql = "SELECT "
				+ "a.id, a.patient_id, a.doctor_id, a.appointment_date, a.time_slot, a.consultation_fee, "
				+ "p.full_name AS patient_name, p.email AS patient_email, p.phone AS patient_mobile, "
				+ "d.name AS doctor_name, dept.name AS department_name " + "FROM appointments a "
				+ "LEFT JOIN patients p ON a.patient_id = p.id " + "LEFT JOIN doctor d ON a.doctor_id = d.id "
				+ "LEFT JOIN departments dept ON d.id = dept.id";

		try (Connection con = DBConnector.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Appointment ap = new Appointment();
				ap.setId(rs.getInt("id"));
				ap.setPatientId(rs.getInt("patient_id"));
				ap.setDoctorId(rs.getInt("doctor_id"));
				ap.setAppointmentDate(rs.getDate("appointment_date"));
				ap.setTimeSlot(rs.getString("time_slot"));
				ap.setConsultationFee(rs.getDouble("consultation_fee"));
				ap.setPatientName(rs.getString("patient_name"));
				ap.setPatientEmail(rs.getString("patient_email"));
				ap.setPatientMobile(rs.getString("patient_mobile"));
				ap.setDoctorName(rs.getString("doctor_name"));
				ap.setDepartmentName(rs.getString("department_name"));

				list.add(ap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean isDoctorAvailable(int doctorId, java.util.Date appointmentDate, String timeSlot) {
		String sql = "SELECT * FROM appointments WHERE doctor_id = ? AND appointment_date = ? AND time_slot = ?";
		try (Connection con = DBConnector.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, doctorId);
			ps.setDate(2, new java.sql.Date(appointmentDate.getTime()));
			ps.setString(3, timeSlot);

			ResultSet rs = ps.executeQuery();
			return !rs.next(); // true if doctor is available

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Appointment> getAppointmentsByDoctorId(int doctorId) {
		List<Appointment> list = new ArrayList<>();
		String sql = "SELECT a.id, a.patient_id, a.doctor_id, a.appointment_date, a.time_slot, a.consultation_fee, "
				+ "p.full_name AS patient_name, p.email AS patient_email, p.phone AS patient_mobile "
				+ "FROM appointments a " + "JOIN patients p ON a.patient_id = p.id " + "WHERE a.doctor_id = ? "
				+ "ORDER BY a.appointment_date DESC";

		try (Connection con = DBConnector.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setInt(1, doctorId);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Appointment a = new Appointment();
				a.setId(rs.getInt("id"));
				a.setPatientId(rs.getInt("patient_id"));
				a.setDoctorId(rs.getInt("doctor_id"));
				a.setAppointmentDate(rs.getDate("appointment_date"));
				a.setTimeSlot(rs.getString("time_slot"));
				a.setConsultationFee(rs.getDouble("consultation_fee"));
				a.setPatientName(rs.getString("patient_name"));
				a.setPatientEmail(rs.getString("patient_email"));
				a.setPatientMobile(rs.getString("patient_mobile"));

				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean markAppointmentCompleted(int appointmentId) {
		try (Connection con = DBConnector.getConnection();
				PreparedStatement pst = con
						.prepareStatement("UPDATE appointments SET status = 'Completed' WHERE id = ?")) {
			pst.setInt(1, appointmentId);
			return pst.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static List<Appointment> getFilteredPendingAppointments(String date, String department) {
		List<Appointment> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder("SELECT * FROM appointments WHERE status = 'Pending'");
		if (date != null && !date.isEmpty()) {
			sql.append(" AND appointment_date = ?");
		}
		if (department != null && !department.isEmpty()) {
			sql.append(" AND department = ?");
		}
		try (Connection con = DBConnector.getConnection();
				PreparedStatement ps = con.prepareStatement(sql.toString())) {
			int index = 1;
			if (date != null && !date.isEmpty())
				ps.setString(index++, date);
			if (department != null && !department.isEmpty())
				ps.setString(index, department);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Appointment app = new Appointment();
				// populate app from rs
				app.setId(rs.getInt("id"));
				app.setPatientId(rs.getInt("patient_id"));
				app.setDoctorId(rs.getInt("doctor_id"));
				app.setAppointmentDate(rs.getDate("appointment_date"));
				app.setTimeSlot(rs.getString("time_slot"));
				app.setConsultationFee(rs.getDouble("consultation_fee"));
				list.add(app);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Appointment> getAppointmentsByStatus(int patientId, String status) {
		List<Appointment> list = new ArrayList<>();
		try (Connection conn = DBConnector.getConnection();
				PreparedStatement ps = conn
						.prepareStatement("SELECT a.*, d.name AS doctor_name, dept.name AS department_name "
								+ "FROM appointments a " + "JOIN doctors d ON a.doctor_id = d.id "
								+ "JOIN departments dept ON d.department_id = dept.id "
								+ "WHERE a.patient_id = ? AND a.status = ? " + "ORDER BY a.appointment_date DESC")) {

			ps.setInt(1, patientId);
			ps.setString(2, status);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Appointment app = new Appointment();
				app.setId(rs.getInt("id"));
				app.setPatientId(rs.getInt("patient_id"));
				app.setDoctorId(rs.getInt("doctor_id"));
				app.setAppointmentDate(rs.getDate("appointment_date"));
				app.setTimeSlot(rs.getString("time_slot"));
				app.setConsultationFee(rs.getDouble("consultation_fee"));
				app.setDoctorName(rs.getString("doctor_name"));
				app.setDepartmentName(rs.getString("department_name"));
				list.add(app);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Appointment> getPendingAppointments() {
		List<Appointment> list = new ArrayList<>();
		try (Connection conn = DBConnector.getConnection();
				PreparedStatement ps = conn
						.prepareStatement("SELECT a.*, d.name AS doctor_name, dept.name AS department_name, "
								+ "p.name AS patient_name, p.email AS patient_email, p.mobile AS patient_mobile "
								+ "FROM appointments a " + "JOIN doctors d ON a.doctor_id = d.id "
								+ "JOIN departments dept ON d.department_id = dept.id "
								+ "JOIN patients p ON a.patient_id = p.id " + "WHERE a.status = 'Pending' "
								+ "ORDER BY a.appointment_date ASC")) {

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Appointment app = new Appointment();
				app.setId(rs.getInt("id"));
				app.setPatientId(rs.getInt("patient_id"));
				app.setDoctorId(rs.getInt("doctor_id"));
				app.setAppointmentDate(rs.getDate("appointment_date"));
				app.setTimeSlot(rs.getString("time_slot"));
				app.setConsultationFee(rs.getDouble("consultation_fee"));
				app.setDoctorName(rs.getString("doctor_name"));
				app.setDepartmentName(rs.getString("department_name"));
				app.setPatientName(rs.getString("patient_name"));
				app.setPatientEmail(rs.getString("patient_email"));
				app.setPatientMobile(rs.getString("patient_mobile"));
				list.add(app);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static boolean updateAppointmentStatus(int appointmentId, String status) {
		boolean result = false;
		try (Connection conn = DBConnector.getConnection();
				PreparedStatement ps = conn.prepareStatement("UPDATE appointments SET status = ? WHERE id = ?")) {

			ps.setString(1, status);
			ps.setInt(2, appointmentId);
			int rows = ps.executeUpdate();
			result = rows > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// Example method: Get doctor's name by ID
	public String getDoctorNameById(int doctorId) {
		String name = "";
		try (Connection con = DBConnector.getConnection();
				PreparedStatement ps = con.prepareStatement("SELECT name FROM doctor WHERE id = ?")) {
			ps.setInt(1, doctorId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	// Example method: Get department
	public String getDoctorDepartmentById(int doctorId) {
		String department = "";
		try (Connection con = DBConnector.getConnection();
				PreparedStatement ps = con.prepareStatement("SELECT department FROM doctor WHERE id = ?")) {
			ps.setInt(1, doctorId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				department = rs.getString("department");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return department;
	}

	public List<Appointment> getAppointmentsForPatient(int patientId) {
		List<Appointment> appointments = new ArrayList<>();

		String sql = "SELECT a.id, a.patient_id, a.doctor_id, a.appointment_date, a.time_slot, a.consultation_fee,  "
				+ "d.name AS doctor_name, dept.name AS department_name " + "FROM appointments a "
				+ "JOIN doctors d ON a.doctor_id = d.id " + "JOIN departments dept ON d.department_id = dept.id "
				+ "WHERE a.patient_id = ? " + "ORDER BY a.appointment_date DESC";

		try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, patientId);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Appointment appointment = new Appointment();
					appointment.setId(rs.getInt("id"));
					appointment.setPatientId(rs.getInt("patient_id"));
					appointment.setDoctorId(rs.getInt("doctor_id"));
					appointment.setAppointmentDate(rs.getDate("appointment_date"));
					appointment.setTimeSlot(rs.getString("time_slot"));
					appointment.setConsultationFee(rs.getDouble("consultation_fee"));
					appointment.setDoctorName(rs.getString("doctor_name"));
					appointment.setDepartmentName(rs.getString("department_name"));

					appointments.add(appointment);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return appointments;
	}

}
