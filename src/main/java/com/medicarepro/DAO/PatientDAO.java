package com.medicarepro.DAO;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import com.medicarepro.DTO.Patient;
import com.medicarepro.utility.DBConnector;

public class PatientDAO {

	public boolean registerPatient(Patient p) throws Exception {
		String sql = "INSERT INTO patients (full_name, dob, age, gender, blood_group, marital_status, phone, alternate_phone, email, address, "
				+ "emergency_name, emergency_relation, emergency_phone, govt_id_type, govt_id_number, insurance_company, insurance_number, "
				+ "allergies, history, medications, habits, patient_type, admission_date, ward, bed, doctor, reason, discharge_date, instructions, diet) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = DBConnector.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, p.getFullName());
			ps.setDate(2, new java.sql.Date(p.getDob().getTime()));
			ps.setInt(3, p.getAge());
			ps.setString(4, p.getGender());
			ps.setString(5, p.getBloodGroup());
			ps.setString(6, p.getMaritalStatus());
			ps.setString(7, p.getPhone());
			ps.setString(8, p.getAlternatePhone());
			ps.setString(9, p.getEmail());
			ps.setString(10, p.getAddress());
			ps.setString(11, p.getEmergencyName());
			ps.setString(12, p.getEmergencyRelation());
			ps.setString(13, p.getEmergencyPhone());
			ps.setString(14, p.getGovtIdType());
			ps.setString(15, p.getGovtIdNumber());
			ps.setString(16, p.getInsuranceCompany());
			ps.setString(17, p.getInsuranceNumber());
			ps.setString(18, p.getAllergies());
			ps.setString(19, p.getHistory());
			ps.setString(20, p.getMedications());
			ps.setString(21, p.getHabits());
			ps.setString(22, p.getPatientType());
			ps.setDate(23, p.getAdmissionDate() != null ? new java.sql.Date(p.getAdmissionDate().getTime()) : null);
			ps.setString(24, p.getWard());
			ps.setString(25, p.getBed());
			ps.setString(26, p.getDoctor());
			ps.setString(27, p.getReason());
			ps.setDate(28, p.getDischargeDate() != null ? new java.sql.Date(p.getDischargeDate().getTime()) : null);
			ps.setString(29, p.getInstructions());
			ps.setString(30, p.getDiet());

			return ps.executeUpdate() > 0;
		}
	}

	public static Patient findPatientByKeyword(String keyword) {
	    Patient patient = null;
	    String sql = "SELECT * FROM patients WHERE id = ? OR full_name LIKE ? OR email LIKE ? OR phone LIKE ?";

	    try (Connection conn = DBConnector.getConnection(); 
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        try {
	            stmt.setInt(1, Integer.parseInt(keyword));
	        } catch (NumberFormatException e) {
	            stmt.setInt(1, -1);
	        }

	        String likeKeyword = "%" + keyword + "%";
	        stmt.setString(2, likeKeyword);
	        stmt.setString(3, likeKeyword);
	        stmt.setString(4, likeKeyword);

	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            patient = new Patient();
	            patient.setId(rs.getInt("id"));
	            patient.setFullName(rs.getString("full_name"));
	            patient.setEmail(rs.getString("email"));
	            patient.setPhone(rs.getString("phone"));
	            patient.setGender(rs.getString("gender"));
	            patient.setAddress(rs.getString("address"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return patient;
	}


	public List<Patient> searchPatients(String query) throws SQLException {
		List<Patient> patients = new ArrayList<>();
		String sql = "SELECT * FROM patients WHERE full_name LIKE ? OR email LIKE ? OR phone LIKE ?";
		try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			String searchTerm = "%" + query + "%";
			ps.setString(1, searchTerm);
			ps.setString(2, searchTerm);
			ps.setString(3, searchTerm);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Patient p = new Patient();
					p.setId(rs.getInt("id"));
					p.setFullName(rs.getString("full_name"));
					p.setEmail(rs.getString("email"));
					p.setPhone(rs.getString("mobile"));
					patients.add(p);
				}
			}
		}
		return patients;
	}

	public Patient getPatientById(int id) {
		Patient p = null;
		try (Connection con = DBConnector.getConnection();
				PreparedStatement pst = con.prepareStatement("SELECT * FROM patients WHERE id = ?")) {

			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				p = new Patient();
				p.setId(rs.getInt("id"));
				p.setFullName(rs.getString("full_name"));
				p.setGender(rs.getString("gender"));
				p.setBloodGroup(rs.getString("blood_group"));
				p.setMaritalStatus(rs.getString("marital_status"));
				p.setPhone(rs.getString("phone"));
				p.setAlternatePhone(rs.getString("alternate_phone"));
				p.setEmail(rs.getString("email"));
				p.setAddress(rs.getString("address"));

				p.setEmergencyName(rs.getString("emergency_name"));
				p.setEmergencyRelation(rs.getString("emergency_relation"));
				p.setEmergencyPhone(rs.getString("emergency_phone"));

				p.setGovtIdType(rs.getString("govt_id_type"));
				p.setGovtIdNumber(rs.getString("govt_id_number"));
				p.setInsuranceCompany(rs.getString("insurance_company"));
				p.setInsuranceNumber(rs.getString("insurance_number"));

				p.setAllergies(rs.getString("allergies"));
				p.setHistory(rs.getString("history"));
				p.setMedications(rs.getString("medications"));
				p.setHabits(rs.getString("habits"));
				p.setPatientType(rs.getString("patient_type"));

				p.setDob(rs.getDate("dob"));
				p.setAdmissionDate(rs.getDate("admission_date"));
				p.setDischargeDate(rs.getDate("discharge_date"));

				p.setAge(rs.getInt("age"));
				p.setWard(rs.getString("ward"));
				p.setBed(rs.getString("bed"));
				p.setDoctor(rs.getString("doctor"));
				p.setReason(rs.getString("reason"));
				p.setInstructions(rs.getString("instructions"));
				p.setDiet(rs.getString("diet"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	public int getPatientIdByNameOrId(String searchQuery) {
		int patientId = -1;
		try {
			String sql = "SELECT id FROM patients WHERE full_name = ? OR id = ?";
			Connection conn = DBConnector.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			// Set parameters: first is full_name, second is id
			ps.setString(1, searchQuery);

			// Try parsing searchQuery to int for id search, otherwise set to -1 (which
			// won't match any id)
			int idParam;
			try {
				idParam = Integer.parseInt(searchQuery);
			} catch (NumberFormatException e) {
				idParam = -1; // Invalid integer id, so won't match
			}
			ps.setInt(2, idParam);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				patientId = rs.getInt("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return patientId;
	}

	public String getEmailByPatientId(int patientId) {
		String email = null;
		try (Connection con = DBConnector.getConnection();
				PreparedStatement pst = con.prepareStatement("SELECT email FROM patients WHERE id = ?")) {
			pst.setInt(1, patientId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				email = rs.getString("email");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return email;
	}

	public String getNameByPatientId(int patientId) {
		String name = null;
		try (Connection con = DBConnector.getConnection();
				PreparedStatement pst = con.prepareStatement("SELECT full_name FROM patients WHERE id = ?")) {
			pst.setInt(1, patientId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				name = rs.getString("full_name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	
	public static List<Patient> getPatientsByType(String type) {
	    List<Patient> list = new ArrayList<>();
	    String sql = "SELECT * FROM patients WHERE patient_type = ?";
	    
	    try (Connection conn = DBConnector.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setString(1, type);  // type should be either 'Inpatient' or 'Outpatient'
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	            Patient p = new Patient();
	            p.setId(rs.getInt("id"));
	            p.setFullName(rs.getString("full_name"));
	            p.setAge(rs.getInt("age"));
	            p.setGender(rs.getString("gender"));
	            p.setPhone(rs.getString("phone"));
	            p.setReason(rs.getString("reason"));
	            p.setPatientType(rs.getString("patient_type"));
	            list.add(p);
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return list;
	}

	
	public Patient validateLogin(String email, String phone) {
	    Patient patient = null;
	    try (Connection conn = DBConnector.getConnection()) {
	        String sql = "SELECT * FROM patients WHERE email = ? AND phone = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, email);
	        ps.setString(2, phone);

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            patient = new Patient();
	            patient.setId(rs.getInt("id"));
	            patient.setFullName(rs.getString("full_name"));
	            patient.setEmail(rs.getString("email"));
	            patient.setPhone(rs.getString("phone"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return patient;
	}

}
