package com.medicarepro.utility;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {

	private static final String URL = "jdbc:mysql://localhost:3306/medicare_pro?useSSL=false&allowPublicKeyRetrieval=true";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "password";

	static {
		try {
			// Load MySQL JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("MySQL Driver not found!");
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
}
