package com.deltron.controllers;

import com.deltron.dao.UserDAO;
import com.deltron.models.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    private static final int MAX_FAILED_ATTEMPTS = 5;
    private final UserDAO userDao = new UserDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validación de campos requeridos
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            handleError(request, response, "Todos los campos son obligatorios");
            return;
        }

        try {
            // Verificar si la cuenta está bloqueada
            if (userDao.isAccountBlocked(email)) {
                handleError(request, response, "Cuenta bloqueada. Contacte al administrador.");
                return;
            }

            // Autenticar usuario
            Optional<User> userOpt = userDao.authenticateByEmail(email, password);
            
            if (userOpt.isPresent()) {
                User user = userOpt.get();
                handleSuccessfulLogin(request, user);
                redirectByRole(user.getRol(), request, response);
            } else {
                handleFailedLogin(email, request, response);
            }
        } catch (SQLException e) {
            handleError(request, response, "Error de base de datos: " + e.getMessage());
        } catch (Exception e) {
            handleError(request, response, "Error interno del sistema: " + e.getMessage());
        }
    }

    private void handleSuccessfulLogin(HttpServletRequest request, User user) {
        HttpSession session = request.getSession(true);
        session.invalidate(); // Invalidar sesión anterior
        session = request.getSession(true); // Crear nueva sesión
        
        session.setAttribute("user", user);
        session.setAttribute("email", user.getEmail());
        session.setAttribute("ROL", user.getRol());
        session.setMaxInactiveInterval(30 * 60); // 30 minutos de inactividad
    }

    private void handleFailedLogin(String email, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            userDao.incrementFailedAttempts(email);
            int attempts = userDao.getFailedAttempts(email);
            int remaining = MAX_FAILED_ATTEMPTS - attempts;
            
            String errorMessage = remaining > 0 
                ? String.format("Credenciales inválidas. Intentos restantes: %d", remaining)
                : "Cuenta bloqueada por seguridad";
            
            handleError(request, response, errorMessage);
        } catch (SQLException e) {
            handleError(request, response, "Error al actualizar intentos fallidos");
        }
    }

    private void redirectByRole(String role, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String contextPath = request.getContextPath();
        String redirectPath = switch(role.toUpperCase()) {
            case "ADMIN" -> contextPath + "views/admin/dashboard.jsp";
            case "VENTAS" -> contextPath + "/ventas/ordenes.jsp";
            case "INVENTARIO" -> contextPath + "/inventario/stock.jsp";
            case "COMPRAS" -> contextPath + "/compras/proveedores.jsp";
            case "CONSULTA" -> contextPath + "/consulta/reportes.jsp";
            default -> contextPath + "/index.jsp";
        };
        response.sendRedirect(redirectPath);
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", message);
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}