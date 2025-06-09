package com.medicarepro.DAO;

import com.medicarepro.DTO.Appointment;
import com.medicarepro.DTO.Doctor;
import com.medicarepro.utility.DBConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorDAO {

	private Connection conn;

	public DoctorDAO() {
		try {
			conn = DBConnector.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Ensure DBConnection returns a valid Connection
	}

	// 1. Get all doctors
	public List<Doctor> getAllDoctors() {
		List<Doctor> doctors = new ArrayList<>();
		String sql = "SELECT * FROM doctor";

		try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				doctors.add(extractDoctorFromResultSet(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return doctors;
	}

	public List<Doctor> getAllDoctor() {
		List<Doctor> doctors = new ArrayList<>();
		try (Connection conn = DBConnector.getConnection();
				PreparedStatement ps = conn.prepareStatement("SELECT id, name FROM doctor");
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Doctor doctor = new Doctor();
				doctor.setId(rs.getInt("id"));
				doctor.setName(rs.getString("name"));
				doctors.add(doctor);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return doctors;
	}

	// 2. Add doctor
	public boolean addDoctor(Doctor doctor) {
		String sql = "INSERT INTO doctor (name, email, phone, gender, department, specialization, experience, qualification, diseases_diagnosed, schedule_days, schedule_time_from, schedule_time_to, consultation_room, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, doctor.getName());
			stmt.setString(2, doctor.getEmail());
			stmt.setString(3, doctor.getPhone());
			stmt.setString(4, doctor.getGender());
			stmt.setString(5, doctor.getDepartment());
			stmt.setString(6, doctor.getSpecialization());
			stmt.setInt(7, doctor.getExperience());
			stmt.setString(8, doctor.getQualification());
			stmt.setString(9, doctor.getDiseasesDiagnosed());
			stmt.setString(10, doctor.getScheduleDays());
			stmt.setTime(11, doctor.getScheduleTimeFrom());
			stmt.setTime(12, doctor.getScheduleTimeTo());
			stmt.setString(13, doctor.getConsultationRoom());
			stmt.setString(14, doctor.getStatus());

			return stmt.executeUpdate() == 1;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// 3. Get doctor by ID
	public Doctor getDoctorById(int id) {
		String sql = "SELECT * FROM doctor WHERE id = ?";
		Doctor doctor = null;

		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, id);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					doctor = extractDoctorFromResultSet(rs);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return doctor;
	}

	// 4. Update doctor (without changing email & phone)
	public boolean updateDoctor(Doctor doctor) {
		String sql = "UPDATE doctor SET name = ?, gender = ?, department = ?, specialization = ?, experience = ?, qualification = ?, diseases_diagnosed = ?, schedule_days = ?, schedule_time_from = ?, schedule_time_to = ?, consultation_room = ?, status = ? WHERE id = ?";

		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, doctor.getName());
			stmt.setString(2, doctor.getGender());
			stmt.setString(3, doctor.getDepartment());
			stmt.setString(4, doctor.getSpecialization());
			stmt.setInt(5, doctor.getExperience());
			stmt.setString(6, doctor.getQualification());
			stmt.setString(7, doctor.getDiseasesDiagnosed());
			stmt.setString(8, doctor.getScheduleDays());
			stmt.setTime(9, doctor.getScheduleTimeFrom());
			stmt.setTime(10, doctor.getScheduleTimeTo());
			stmt.setString(11, doctor.getConsultationRoom());
			stmt.setString(12, doctor.getStatus());
			stmt.setInt(13, doctor.getId());

			return stmt.executeUpdate() == 1;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// 5. Delete doctor by ID
	public boolean deleteDoctor(int id) {
		String sql = "DELETE FROM doctor WHERE id = ?";

		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, id);
			return stmt.executeUpdate() == 1;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Doctor> searchDoctors(String keyword) {
		List<Doctor> doctors = new ArrayList<>();
		try (Connection con = DBConnector.getConnection()) {
			String sql = "SELECT * FROM doctors WHERE name LIKE ? OR specialization LIKE ? OR department LIKE ?";
			PreparedStatement ps = con.prepareStatement(sql);
			String pattern = "%" + keyword + "%";
			ps.setString(1, pattern);
			ps.setString(2, pattern);
			ps.setString(3, pattern);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Doctor d = new Doctor();
				d.setId(rs.getInt("id"));
				d.setName(rs.getString("name"));
				d.setSpecialization(rs.getString("specialization"));
				d.setPhone(rs.getString("phone"));
				d.setEmail(rs.getString("email"));
				d.setDepartment(rs.getString("department"));
				d.setQualification(rs.getString("qualification"));
				d.setExperience(rs.getInt("experience"));
				d.setDiseasesDiagnosed(rs.getString("diseasesDiagnosed"));
				d.setConsultationRoom(rs.getString("consultationRoom"));
				d.setScheduleDays(rs.getString("schedule_days"));
				d.setScheduleTimeFrom(rs.getTime("schedule_time_from"));
				d.setScheduleTimeTo(rs.getTime("schedule_time_to"));
				d.setConsultationRoom(rs.getString("consultation_room"));
				d.setStatus(rs.getString("status"));
				doctors.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doctors;
	}

	// Helper method
	private Doctor extractDoctorFromResultSet(ResultSet rs) throws SQLException {
		Doctor doctor = new Doctor();
		doctor.setId(rs.getInt("id"));
		doctor.setName(rs.getString("name"));
		doctor.setEmail(rs.getString("email"));
		doctor.setPhone(rs.getString("phone"));
		doctor.setGender(rs.getString("gender"));
		doctor.setDepartment(rs.getString("department"));
		doctor.setSpecialization(rs.getString("specialization"));
		doctor.setExperience(rs.getInt("experience"));
		doctor.setQualification(rs.getString("qualification"));
		doctor.setDiseasesDiagnosed(rs.getString("diseases_diagnosed"));
		doctor.setScheduleDays(rs.getString("schedule_days"));
		doctor.setScheduleTimeFrom(rs.getTime("schedule_time_from"));
		doctor.setScheduleTimeTo(rs.getTime("schedule_time_to"));
		doctor.setConsultationRoom(rs.getString("consultation_room"));
		doctor.setStatus(rs.getString("status"));
		doctor.setCreatedAt(rs.getTimestamp("created_at"));
		doctor.setUpdatedAt(rs.getTimestamp("updated_at"));
		return doctor;
	}

	public List<String> getAllDepartments() throws SQLException {
		List<String> departments = new ArrayList<>();
		String sql = "SELECT DISTINCT department FROM doctor";
		try (Connection conn = DBConnector.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				departments.add(rs.getString("department"));
			}
		}
		return departments;
	}

	public List<String> getAllSpecializations() throws SQLException {
		List<String> specializations = new ArrayList<>();
		String sql = "SELECT DISTINCT specialization FROM doctor";
		try (Connection conn = DBConnector.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				specializations.add(rs.getString("specialization"));
			}
		}
		return specializations;
	}

	public void toggleDoctorStatus(int doctorId) throws SQLException {
		String sql = "UPDATE doctor SET status = CASE WHEN status = 'Active' THEN 'Inactive' ELSE 'Active' END WHERE id = ?";
		try (Connection conn = DBConnector.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, doctorId);
			stmt.executeUpdate();
		}
	}

	public Doctor loginDoctor(String email, String password) throws SQLException {
		String query = "SELECT * FROM doctor WHERE email = ? AND phone = ?";
		PreparedStatement pst = conn.prepareStatement(query);
		pst.setString(1, email);
		pst.setString(2, password);
		ResultSet rs = pst.executeQuery();

		if (rs.next()) {
			Doctor doc = new Doctor();
			doc.setId(rs.getInt("id"));
			doc.setName(rs.getString("name"));
			doc.setEmail(rs.getString("email"));
			// Set other doctor fields as needed
			return doc;
		}
		return null;
	}

	public boolean bookAppointment(Appointment appointment) throws SQLException {
		String sql = "INSERT INTO appointments (patient_id, doctor_id, appointment_date, time_slot, consultation_fee) VALUES (?, ?, ?, ?, ?)";
		try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, appointment.getPatientId());
			ps.setInt(2, appointment.getDoctorId());
			ps.setDate(3, new java.sql.Date(appointment.getAppointmentDate().getTime()));
			ps.setString(4, appointment.getTimeSlot());
			ps.setDouble(5, appointment.getConsultationFee());
			int row = ps.executeUpdate();
			return row > 0;
		}
	}

	public List<Appointment> getAllAppointments() throws SQLException {
		List<Appointment> appointments = new ArrayList<>();
		String sql = "SELECT * FROM appointments ORDER BY appointment_date DESC";
		try (Connection conn = DBConnector.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				Appointment app = new Appointment();
				app.setId(rs.getInt("id"));
				app.setPatientId(rs.getInt("patient_id"));
				app.setDoctorId(rs.getInt("doctor_id"));
				app.setAppointmentDate(rs.getDate("appointment_date"));
				app.setTimeSlot(rs.getString("time_slot"));
				app.setConsultationFee(rs.getDouble("consultation_fee"));
				appointments.add(app);
			}
		}
		return appointments;
	}

	public List<Doctor> getDoctorsByDepartment(String department) {
		List<Doctor> doctors = new ArrayList<>();
		String sql = "SELECT id, name FROM doctor WHERE department = ?";

		try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, department);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Doctor d = new Doctor();
				d.setId(rs.getInt("id"));
				d.setName(rs.getString("name"));
				doctors.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctors;
	}

	public Doctor getDoctorScheduleById(int doctorId) {
		Doctor d = new Doctor();
		String sql = "SELECT schedule_days, schedule_time_from, schedule_time_to, consultation_room FROM doctor WHERE id = ?";
		try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, doctorId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				d.setScheduleDays(rs.getString("schedule_days"));
				d.setScheduleTimeFrom(rs.getTime("schedule_time_from")); // FIXED
				d.setScheduleTimeTo(rs.getTime("schedule_time_to")); // FIXED
				d.setConsultationRoom(rs.getString("consultation_room"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}

}
