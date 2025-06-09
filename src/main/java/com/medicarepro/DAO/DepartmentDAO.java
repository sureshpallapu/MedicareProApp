package com.medicarepro.DAO;

import com.medicarepro.DTO.Department;
import com.medicarepro.utility.DBConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDAO {
	private Connection conn;

	public DepartmentDAO(Connection conn) {
		this.conn = conn;
	}

	public DepartmentDAO() {
		// TODO Auto-generated constructor stub
	}

	public boolean addDepartment(Department dept) {
		String sql = "INSERT INTO departments (name, facilities, doctors, status) VALUES (?, ?, ?, ?)";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, dept.getName());
			ps.setString(2, dept.getFacilities());
			ps.setString(3, dept.getDoctors());
			ps.setString(4, dept.getStatus());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateDepartment(Department dept) {
		String sql = "UPDATE departments SET name = ?, facilities = ?, doctors = ?, status = ? WHERE id = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, dept.getName());
			ps.setString(2, dept.getFacilities());
			ps.setString(3, dept.getDoctors());
			ps.setString(4, dept.getStatus());
			ps.setInt(5, dept.getId());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteDepartment(int id) {
		String sql = "DELETE FROM departments WHERE id = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, id);
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateDepartmentStatus(int id, String status) {
		String sql = "UPDATE departments SET status = ? WHERE id = ?";
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, status);
			stmt.setInt(2, id);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public Department getDepartmentById(int id) {
		Department dept = null;
		try {
			String sql = "SELECT id, name, facilities, doctors, status FROM departments WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				dept = new Department();
				dept.setId(rs.getInt("id"));
				dept.setName(rs.getString("name"));
				dept.setFacilities(rs.getString("facilities")); // Make sure this column exists
				dept.setDoctors(rs.getString("doctors")); // Make sure this column exists
				dept.setStatus(rs.getString("status"));
			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dept;
	}

	public static List<Department> getAllDepartments() {
		List<Department> list = new ArrayList<>();
		String sql = "SELECT * FROM departments";

		try (Connection conn = DBConnector.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				Department dept = new Department();
				dept.setId(rs.getInt("id"));
				dept.setName(rs.getString("name"));
				dept.setFacilities(rs.getString("facilities")); // Add this
				dept.setDoctors(rs.getString("doctors")); // Add this
				dept.setStatus(rs.getString("status")); // Add this
				list.add(dept);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

}
