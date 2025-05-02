package com.deltron.controllers;

import com.deltron.dao.UserDAO;
import com.deltron.models.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AuthController", urlPatterns = {"/auth/login"})
public class AuthController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Obtener parámetros del formulario por EMAIL
        String email = request.getParameter("email"); // ← Cambiar de "usuario" a "email"
        String password = request.getParameter("password");
        
        UserDAO userDao = new UserDAO();
         try {
            if (userDao.isAccountBlocked(email)) { // ← Usar email aquí
                request.setAttribute("errorMessage", "Cuenta bloqueada");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }
        Optional<User> userOpt = userDao.authenticateByEmail(email, password);
        
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            if (user.isBloqueado()) {
                request.setAttribute("error", "Cuenta bloqueada");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("usuario", user);
            redirigirPorRol(user.getRol(), response);
            
        } else {
            request.setAttribute("error", "Credenciales inválidas");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }   catch (SQLException ex) {
            Logger.getLogger(AuthController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    
    
    private void redirigirPorRol(String rol, HttpServletResponse response) throws IOException {
        switch (rol.toUpperCase()) {
  
            
            case "ADMIN" -> response.sendRedirect("views/admin/dashboard.jsp");
            case "VENTAS" -> response.sendRedirect("ventas/dashboard.jsp");
            case "INVENTARIO" -> response.sendRedirect("inventario/dashboard.jsp");
            default -> response.sendRedirect("index.jsp");
        }
    }
}