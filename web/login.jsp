<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<!DOCTYPE html>
<html>
    
<head>       
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deltron | Iniciar Sesión</title>
    
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/footer.css">
</head>

<body>
    <!-- Sección del Header --> 
    <%@include file="/includes/header.jsp" %>
    <!-- Sección del Header -->
    
    
    <section class="login-section">
        <div class="container-fluid">
            <div class="row g-0">
                <!-- Columna de la imagen (mitad izquierda) -->
                <div class="col-lg-6 d-none d-lg-flex login-image-col">
                    <div class="login-image-wrapper">
                        <img src="https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" 
                             alt="Tecnología Deltron" class="login-image">
                        <div class="login-image-overlay">
                            <h2>Bienvenido a Deltron</h2>
                            <p>Tu proveedor confiable de tecnología y soluciones computacionales</p>
                        </div>
                    </div>
                </div>
                
                <!-- Columna del formulario (mitad derecha) -->
                <div class="col-lg-6 login-form-col">
                    <div class="login-form-wrapper">
                        <div class="login-header">
                            <h2>INICIAR SESIÓN</h2>
                            <p>Accede a tu cuenta para continuar</p>
                            
                            <%-- Mostrar mensajes de error --%>
                            <% if(request.getParameter("error") != null) { %>
                                <div class="alert alert-danger mt-3" role="alert">
                                    <i class="bi bi-exclamation-circle-fill me-2"></i>
                                    <% switch(request.getParameter("error")) {
                                        case "1": %>Credenciales incorrectas<% break;
                                        case "2": %>Cuenta inactiva o bloqueada<% break;
                                        case "3": %>Acceso no autorizado<% break;
                                        default: %>Error en el inicio de sesión<% } %>
                                </div>
                            <% } %>
                        </div> <!-- Cierre correcto de login-header -->
                        
                        <form class="login-form" action="LoginServlet" method="POST" id="loginForm">
                            <div class="mb-4">
                                <label for="email" class="form-label">Correo Electrónico</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-envelope-fill"></i>
                                    </span>
                                    <input type="email" class="form-control" id="email" name="email" 
                                           required placeholder="ejemplo@deltron.com"
                                           pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                           maxlength="100">
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label for="password" class="form-label">Contraseña</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-lock-fill"></i>
                                    </span>
                                    <input type="password" class="form-control" id="password" name="password" 
                                           required placeholder="••••••••"
                                           minlength="8"
                                           maxlength="64">
                                    <button type="button" class="btn btn-outline-secondary toggle-password" 
                                            data-target="#password">
                                        <i class="bi bi-eye-fill"></i>
                                    </button>
                                </div>
                            </div>
                            
                            <div class="d-flex justify-content-between mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="remember" name="remember">
                                    <label class="form-check-label" for="remember">Recordar sesión</label>
                                </div>
                                <a href="forgot-password.jsp" class="forgot-password">¿Olvidaste tu contraseña?</a>
                            </div>
                            
                            <button type="submit" class="btn btn-primary btn-login w-100 py-2 mb-3">
                                <i class="bi bi-box-arrow-in-right me-2"></i> Ingresar
                            </button>
                        </form>
                        
                        <div class="login-footer mt-4">
                            <p>¿No tienes una cuenta? <a href="register.jsp" class="text-primary">Regístrate aquí</a></p>
                        </div>
                    </div> <!-- Cierre de login-form-wrapper -->
                </div> <!-- Cierre de login-form-col -->
            </div> <!-- Cierre de row -->
        </div> <!-- Cierre de container-fluid -->
    </section>
    
    <!-- Sección del Footer --> 
    <%@include file="/includes/footer.jsp" %>
    
    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>  
    <script>
        // Validación del lado del cliente
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const email = document.getElementById('email');
            const password = document.getElementById('password');
            
            // Validar formato de email
            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)) {
                alert('Por favor ingrese un correo electrónico válido');
                email.focus();
                e.preventDefault();
                return false;
            }
            
            // Validar complejidad de contraseña
            if (password.value.length < 8) {
                alert('La contraseña debe tener al menos 8 caracteres');
                password.focus();
                e.preventDefault();
                return false;
            }
            
            return true;
        });
        
        // Mostrar/ocultar contraseña
        document.querySelectorAll('.toggle-password').forEach(button => {
            button.addEventListener('click', function() {
                const target = document.querySelector(this.dataset.target);
                const type = target.type === 'password' ? 'text' : 'password';
                target.type = type;
                this.querySelector('i').classList.toggle('bi-eye-fill');
                this.querySelector('i').classList.toggle('bi-eye-slash-fill');
            });
        });
    </script>
</body>
</html>