/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.deltron.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import com.deltron.util.ConexionBD;
import javax.servlet.http.HttpSession;



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Obtener parámetros del formulario
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            // 1. Obtener conexión
            conn = ConexionBD.getConnection();
            
            // 2. Crear consulta preparada
            //String sql = "SELECT * FROM USUARIOS WHERE email = ? AND activo = 1";
            String sql = "SELECT idUsuario, rol, contrasena FROM USUARIOS WHERE email = ? AND activo = 1";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            
            // 3. Ejecutar consulta
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                // 4. Verificar contraseña
                String hashAlmacenado = rs.getString("contrasena");
                
                if (BCrypt.checkpw(password, hashAlmacenado)) {
                String idUsuario = rs.getString("idUsuario");
                String rol = rs.getString("rol");
                
                System.out.println("ID desde BD: " + idUsuario); // Debe mostrar un valor
                System.out.println("Rol desde BD: " + rol); // Debe mostrar "admin"
                
                // Guardar en sesión
                HttpSession session = request.getSession();
                session.setAttribute("idUsuario", idUsuario);
                session.setAttribute("rol", rol);
                               
                
            // Actualizar último login
            try {
            String updateSql = "UPDATE USUARIOS SET ultimo_login = NOW() WHERE idUsuario = ?";
            PreparedStatement pstmtUpdate = conn.prepareStatement(updateSql);
            pstmtUpdate.setString(1, idUsuario);
            int rowsUpdated = pstmtUpdate.executeUpdate();
            System.out.println("Filas actualizadas: " + rowsUpdated); // Debe ser 1
            } catch (SQLException e) {
                System.out.println("Error al actualizar último login: " + e.getMessage());
                    }
                
                System.out.println("Usuario autenticado. Rol: " + rol);
                
                // Redirección basada en el rol
                if ("ADMIN".equals(rol)) {
                    request.getRequestDispatcher("views/admin/dashboard.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                    }    
                }    
                
                } else {
                    response.sendRedirect("login.jsp?error=1");
                }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=3");
        } finally {
            // 6. Cerrar recursos en orden inverso
            ConexionBD.close(rs);
            ConexionBD.close(pstmt);
            ConexionBD.close(conn);
        }
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}