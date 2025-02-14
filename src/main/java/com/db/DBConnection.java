package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.utils.DBConfig;

public class DBConnection {
	static Connection connection = null;
	public static Connection getConnection() {
		try {
			Class.forName(DBConfig.Driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(DBConfig.URL, DBConfig.USERNAME, DBConfig.PASSWORD);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public static void closeConnection() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

