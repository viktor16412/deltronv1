<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Verificación de sesión administrativa -->
<%
    System.out.println("ROL EN SIDEBAR: " + session.getAttribute("rol"));
    System.out.println("ID USUARIO: " + session.getAttribute("idUsuario"));
%>
<%
    String rol = (String) session.getAttribute("rol");
    if (rol == null || !rol.equals("ADMIN")) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!-- Sidebar de Administración -->
<div class="admin-sidebar">
    <div class="sidebar-header">
        <h5 class="mb-0 text-white">Navegación</h5>
    </div>
    
    <nav class="sidebar-menu pt-3">
        <ul class="nav flex-column">
            <!-- Dashboard -->
            <li class="nav-item">
                <a class="nav-link active" href="${pageContext.request.contextPath}/admin/dashboard.jsp">
                    <i class="bi bi-speedometer2 me-2"></i> Dashboard
                </a>
            </li>

            <!-- Gestión de Contenido -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#gestContent" data-bs-toggle="collapse">
                    <i class="bi bi-boxes me-2"></i> Gestión General
                </a>
                <div class="collapse show" id="gestContent">
                    <ul class="nav flex-column ms-4">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/almacenes.jsp">
                                <i class="bi bi-shop me-2"></i> Almacenes
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/categorias.jsp">
                                <i class="bi bi-tags me-2"></i> Categorías
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/productos.jsp">
                                <i class="bi bi-cpu me-2"></i> Productos
                            </a>
                        </li>
                    </ul>
                </div>
            </li>

            <!-- Movimientos y Documentos -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#gestMovimientos" data-bs-toggle="collapse">
                    <i class="bi bi-arrow-left-right me-2"></i> Operaciones
                </a>
                <div class="collapse" id="gestMovimientos">
                    <ul class="nav flex-column ms-4">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/movalmacen.jsp">
                                <i class="bi bi-arrow-repeat me-2"></i> Mov. Almacén
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/ingresosalida.jsp">
                                <i class="bi bi-clipboard-data me-2"></i> Ingresos/Salidas
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/documentos.jsp">
                                <i class="bi bi-file-earmark-text me-2"></i> Tipos Documento
                            </a>
                        </li>
                    </ul>
                </div>
            </li>

            <!-- Clientes/Proveedores -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/clieprov.jsp">
                    <i class="bi bi-people me-2"></i> Clientes/Proveedores
                </a>
            </li>

            <!-- Auditoría -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/auditoria.jsp">
                    <i class="bi bi-clipboard-check me-2"></i> Registro de Actividades
                </a>
            </li>
        </ul>
    </nav>

    <!-- Versión del Sistema -->
    <div class="sidebar-footer mt-auto p-3">
        <small class="text-muted">v2.1.0</small>
    </div>
</div>