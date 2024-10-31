package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	// Database connection parameters
	private static final String HOST = "192.168.18.245";
	private static final String PORT = "3306";
	private static final String DATABASE = "javadb_168"; // Replace with your database name
	private static final String USER = "javadb_168"; // Replace with your MySQL username
	private static final String PASSWORD = "Sp3cJa5A2k24"; // Replace with your MySQL password

	// Method to get a connection
	public static Connection getConnection() throws SQLException {
		String url = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			System.out.println(e);
		}
		return DriverManager.getConnection(url, USER, PASSWORD);
	}
}