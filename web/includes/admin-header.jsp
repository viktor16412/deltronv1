<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header class="admin-header">
    <nav class="navbar navbar-dark bg-admin">
        <div class="container-fluid">
            <!-- Logo y título del panel -->
            <a class="navbar-brand" href="dashboard.jsp">
                <div class="d-flex align-items-center">
                    <i class="bi bi-shield-lock fs-3 me-2"></i>
                    <div>
                        <span class="h5 mb-0">DELTRON</span><br>
                        <small class="text-muted">Panel de Administración</small>
                    </div>
                </div>
            </a>

            <!-- Menú superior derecho -->
            <div class="d-flex align-items-center">
                <!-- Notificaciones -->
                <div class="dropdown me-3">
                    <button class="btn btn-link text-white" type="button" data-bs-toggle="dropdown">
                        <i class="bi bi-bell fs-5"></i>
                        <span class="badge bg-danger">3</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><h6 class="dropdown-header">Notificaciones recientes</h6></li>
                        <li><a class="dropdown-item" href="#">Nuevo pedido recibido</a></li>
                        <li><a class="dropdown-item" href="#">Stock bajo en memorias</a></li>
                    </ul>
                </div>

                <!-- Menú usuario admin -->
                <div class="dropdown">
                    <button class="btn btn-link text-white dropdown-toggle" 
                            type="button" 
                            data-bs-toggle="dropdown">
                        <i class="bi bi-person-circle fs-5 me-1"></i>
                        <%= session.getAttribute("nombre") %>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#">
                            <i class="bi bi-speedometer2 me-2"></i>Dashboard
                        </a></li>
                        <li><a class="dropdown-item" href="admin-profile.jsp">
                            <i class="bi bi-gear me-2"></i>Configuración
                        </a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="AdminLogoutServlet">
                            <i class="bi bi-box-arrow-right me-2"></i>Cerrar sesión
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>