package com.example.project_m3_team4.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//    private static final String URL = "jdbc:mysql://localhost:3306/project_m3_team4";
//    private static final String USER = "root";
//    private static final String PASS = "123123";
//    private static ConnectDB instance;
//    private Connection connection;

public class ConnectDB {
    private static final String URL = "jdbc:mysql://localhost:3306/project_m3_team4" ;
//            "?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = "123123";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connection successful");
            return conn;
        } catch (ClassNotFoundException e) {
            System.out.println("Database driver not found: " + e.getMessage());
            throw new SQLException("Database driver not found", e);
        } catch (SQLException e) {
            System.out.println("Database connection failed: " + e.getMessage());
            throw e;
        }
    }
}