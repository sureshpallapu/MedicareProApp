package com.medicarepro.DAO;

import java.sql.*;
import java.util.*;

import com.medicarepro.DTO.Staff;
import com.medicarepro.utility.DBConnector;

public class StaffDAO {
    private Connection conn;

    public StaffDAO() throws SQLException {
        conn = DBConnector.getConnection();
    }

    public List<Staff> getAllStaff() throws SQLException {
        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT * FROM staff";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Staff s = new Staff();
            s.setStaffId(rs.getInt("staffId"));
            s.setName(rs.getString("name"));
            s.setPhone(rs.getString("phone"));
            s.setEmail(rs.getString("email"));
            s.setDepartment(rs.getString("department"));
            s.setQualification(rs.getString("qualification"));
            s.setExperience(rs.getString("experience"));
            s.setShift(rs.getString("shift"));
            s.setStatus(rs.getString("status"));
            staffList.add(s);
        }
        return staffList;
    }

    public boolean addStaff(Staff staff) throws SQLException {
        String sql = "INSERT INTO staff (staffId, name, phone, email, department, qualification, experience, shift, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, staff.getStaffId());
        ps.setString(2, staff.getName());
        ps.setString(3, staff.getPhone());
        ps.setString(4, staff.getEmail());
        ps.setString(5, staff.getDepartment());
        ps.setString(6, staff.getQualification());
        ps.setString(7, staff.getExperience());
        ps.setString(8, staff.getShift());
        ps.setString(9, staff.getStatus());
        return ps.executeUpdate() > 0;
    }

    public boolean deleteStaffById(int staffId) throws SQLException {
        String sql = "DELETE FROM staff WHERE staffId=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, staffId);
        return ps.executeUpdate() > 0;
    }

    public boolean updateStatus(int staffId, String status) throws SQLException {
        String sql = "UPDATE staff SET status=? WHERE staffId=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, status);
        ps.setInt(2, staffId);
        return ps.executeUpdate() > 0;
    }
    public Staff login(String email, String phone) {
        Staff staff = null;
        try (Connection conn = DBConnector.getConnection()) {
            String sql = "SELECT * FROM staff WHERE email = ? AND phone = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, phone);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                staff = new Staff();
                staff.setStaffId(rs.getInt("staffId"));
                staff.setName(rs.getString("name"));
                staff.setPhone(rs.getString("phone"));
                staff.setEmail(rs.getString("email"));
                staff.setDepartment(rs.getString("department"));
                staff.setQualification(rs.getString("qualification"));
                staff.setExperience(rs.getString("experience"));
                staff.setShift(rs.getString("shift"));
                staff.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return staff;
    }


}
