package com.deltron.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConexionBD {
    private static final String URL = "jdbc:mysql://u1udqxk0zfcbbx1p:ue51ALwe8hpk4NckgqHq@besprahphhr9as4mlnt9-mysql.services.clever-cloud.com:3306/besprahphhr9as4mlnt9?serverTimezone=America/Lima";
    private static final String USER = "u1udqxk0zfcbbx1p";
    private static final String PASS = "ue51ALwe8hpk4NckgqHq";
    
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver MySQL no encontrado", e);
        }
    }
    
    public static void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexión: " + e.getMessage());
            }
        }
    }
    
    public static void close(PreparedStatement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar PreparedStatement: " + e.getMessage());
            }
        }
    }
    
    public static void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar ResultSet: " + e.getMessage());
            }
        }
    }
    
    public static void closeAll(Connection conn, PreparedStatement stmt, ResultSet rs) {
        close(rs);
        close(stmt);
        close(conn);
    }
    
    
}
