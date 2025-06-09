package com.medicarepro.DAO;

import com.medicarepro.DTO.EmergencyPatient;
import com.medicarepro.utility.DBConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmergencyPatientDAO {

	// Insert new emergency patient
	public static boolean addEmergencyPatient(EmergencyPatient ep) {
	    String sql = "INSERT INTO emergency_patients (name, age, gender, phone, condition_desc, priority, department_id, doctor_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	    try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, ep.getName());
	        ps.setInt(2, ep.getAge());
	        ps.setString(3, ep.getGender());
	        ps.setString(4, ep.getPhone());
	        ps.setString(5, ep.getCondition());
	        ps.setInt(6, ep.getPriority());
	        ps.setInt(7, ep.getDepartmentId());
	        ps.setInt(8, ep.getDoctorId());

	        int rowsInserted = ps.executeUpdate();
	        return rowsInserted > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}


	// Fetch all emergency patients ordered by priority ascending
	public static List<EmergencyPatient> getAllOrderedByPriority() {
	    List<EmergencyPatient> list = new ArrayList<>();
	    String sql = "SELECT id, name, age, gender, phone, condition_desc, priority " +
	                 "FROM emergency_patients " +
	                 "ORDER BY priority ASC, id ASC";

	    try (Connection conn = DBConnector.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            EmergencyPatient ep = new EmergencyPatient();
	            ep.setId(rs.getInt("id"));
	            ep.setName(rs.getString("name"));
	            ep.setAge(rs.getInt("age"));
	            ep.setGender(rs.getString("gender"));
	            ep.setPhone(rs.getString("phone"));
	            ep.setCondition(rs.getString("condition_desc"));
	            ep.setPriority(rs.getInt("priority"));

	            list.add(ep);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}

}
