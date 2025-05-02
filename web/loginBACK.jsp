<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
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
                            
                            <!-- Mensaje de error -->
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger mt-3" role="alert">
                                    <c:choose>
                                        <c:when test="${errorMessage == 'blocked'}">
                                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                            Cuenta bloqueada por muchos intentos fallidos. Contacta al administrador.
                                        </c:when>
                                        <c:when test="${errorMessage == 'invalid_credentials'}">
                                            <i class="bi bi-exclamation-circle-fill me-2"></i>
                                            Correo o contraseña incorrectos
                                        </c:when>
                                        <c:when test="${errorMessage == 'email_not_registered'}">
                                            <i class="bi bi-envelope-exclamation-fill me-2"></i>
                                            El correo no está registrado
                                        </c:when>
                                        <c:otherwise>
                                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                            ${errorMessage}
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:if>
                        </div>
                        
                        <form class="login-form" action="login" method="POST">
                            <div class="mb-4">
                                <label for="email" class="form-label">Correo Electrónico</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-envelope-fill"></i>
                                    </span>
                                    <input type="email" class="form-control" id="email" name="email" 
                                           required placeholder="ejemplo@deltron.com">
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label for="password" class="form-label">Contraseña</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-lock-fill"></i>
                                    </span>
                                    <input type="password" class="form-control" id="password" name="password" 
                                           required placeholder="••••••••">
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
                            
                            <div class="login-divider">
                                <span>o</span>
                            </div>
                            
                            <button type="button" class="btn btn-outline-secondary btn-google w-100 py-2 mt-3">
                                <img src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg" alt="Google" width="20">
                                <span class="ms-2">Continuar con Google</span>
                            </button>
                        </form>
                        
                        <div class="login-footer mt-4">
                            <p>¿No tienes una cuenta? <a href="register.jsp" class="text-primary">Regístrate aquí</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Sección del Footer --> 
    <%@include file="/includes/footer.jsp" %>
    <!-- Sección del Footer -->
    
    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validación básica del formulario
        document.querySelector('.login-form').addEventListener('submit', function(e) {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            if (!email || !password) {
                e.preventDefault();
                alert('Por favor complete todos los campos');
            }
        });
    </script>
</body>
</html>