package com.medicarepro.DAO;

import com.medicarepro.DTO.AdminDTO;


import com.medicarepro.utility.DBConnector;
import java.sql.*;

public class AdminDAO {
	public AdminDTO getAdminByCredentials(String username, String password) {
		AdminDTO admin = null;

		try (Connection conn = DBConnector.getConnection();
				PreparedStatement stmt = conn.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?")) {

			stmt.setString(1, username);
			stmt.setString(2, password);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				admin = new AdminDTO();
				admin.setId(rs.getInt("id"));
				admin.setUsername(rs.getString("username"));
			}

			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return admin;
	}
}
