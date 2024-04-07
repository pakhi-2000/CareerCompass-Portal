package com.DB;
import java.sql.*;

public class DBConnect {
    public static Connection getConnection() {
        Connection conn = null;
        String host = "jdbc:mysql://localhost:3306/Job_Portal";
        String username = "root";
        String password = "12345678";
        try {
        	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(host, username, password);
            System.out.println("Connected to MySQL database");
        } catch (SQLException e) {
            System.out.println("Failed to connect to MySQL database");
            e.printStackTrace();
        }
        return conn;
    }
}