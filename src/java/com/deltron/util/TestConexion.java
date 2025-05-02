


package com.deltron.util;

import java.sql.Connection;
import java.sql.SQLException;


public class TestConexion {
    public static void main(String[] args) {
        try (Connection conn = ConexionBD.getConnection()) {
            System.out.println("✅ Conexión exitosa a la BD!");
            System.out.println("Versión del servidor: " + conn.getMetaData().getDatabaseProductVersion());
        } catch (SQLException e) {
            System.err.println("❌ Error de conexión: " + e.getMessage());
        }
    }
}