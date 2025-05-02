package com.deltron.dao;

import com.deltron.models.User;
import com.deltron.util.ConexionBD;
import java.sql.*;
import java.util.Optional;
import java.util.UUID;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAO {
    private static final int MAX_FAILED_ATTEMPTS = 5;

    // Método para autenticar por email
    public Optional<User> authenticateByEmail(String email, String password) throws SQLException {
        System.out.println("Intentando autenticar: " + email);
    String sql = "SELECT * FROM USUARIOS WHERE email = ? AND activo = 1 AND bloqueado = 0";
    
    try (Connection conn = ConexionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setString(1, email);
        
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                User user = new User();
                user.setIdUsuario(UUID.fromString(rs.getString("idusuario")));
                user.setEmail(rs.getString("email"));
                user.setContrasena(rs.getString("contrasena"));
                user.setRol(rs.getString("rol"));
                user.setActivo(rs.getBoolean("activo"));
                
                if (BCrypt.checkpw(password, user.getContrasena())) {
                    return Optional.of(user);
                }
            }
        }
    }
    return Optional.empty();
}

    // Método para verificar cuenta bloqueada
    public boolean isAccountBlocked(String email) throws SQLException {
        String sql = "SELECT bloqueado FROM USUARIOS WHERE email = ?";
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() && rs.getBoolean("bloqueado");
            }
        }
    }

    // Método para incrementar intentos fallidos
      public void incrementFailedAttempts(String email) throws SQLException {
        String sql = "UPDATE USUARIOS SET " +
                   "intentos_fallidos = intentos_fallidos + 1, " +
                   "bloqueado = CASE WHEN intentos_fallidos >= ? THEN 1 ELSE bloqueado END " +
                   "WHERE email = ?";
        
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, MAX_FAILED_ATTEMPTS - 1); // Bloquea al superar el límite
            stmt.setString(2, email);
            stmt.executeUpdate();
        }
    }

    // Método para obtener intentos fallidos
    public int getFailedAttempts(String email) throws SQLException {
        String sql = "SELECT intentos_fallidos FROM USUARIOS WHERE email = ?";
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() ? rs.getInt("intentos_fallidos") : 0;
            }
        }
    }

    // Método para resetear intentos
    private void resetFailedAttempts(UUID userId) throws SQLException {
    String sql = "UPDATE USUARIOS SET intentos_fallidos = 0 WHERE idusuario = ?";
    try (Connection conn = ConexionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        // Convertir UUID a String
        stmt.setString(1, userId.toString()); // ← Conversión aquí
        stmt.executeUpdate();
    }
}

    private User mapUser(ResultSet rs) throws SQLException {
    User user = new User();
    // Convertir String a UUID
    user.setIdUsuario(UUID.fromString(rs.getString("idusuario"))); // ← Corrección aquí
    user.setEmail(rs.getString("email"));
    user.setContrasena(rs.getString("contrasena"));
    user.setRol(rs.getString("rol"));
    user.setBloqueado(rs.getBoolean("bloqueado"));
    return user;
}
}