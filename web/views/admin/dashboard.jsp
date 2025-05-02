<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin - DELTRON</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- CSS -->
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">  
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>

<body class="admin-layout">
    <%@include file="/includes/admin-header.jsp" %>
    
    <div class="container-fluid">
        <div class="layout-grid"> <!-- Contenedor grid -->
            
            <!-- Sidebar -->
            <aside class="sidebar">
                <%@include file="/includes/admin-sidebar.jsp" %>
            </aside>
            
            <!-- Main Content -->
            <main class="main-content">
                <div class="dashboard-grid"> <!-- Grid interno -->
                    
                    <!-- Sección Métricas -->
                    <section class="metricas-container">
                        <div class="dash-card">
                            <div class="icon-card bg-primary">
                                <i class="bi bi-graph-up"></i>
                            </div>
                            <div class="card-content">
                                <h3>Admira</h3>
                                <p class="valor">8</p>
                            </div>
                        </div>
                        
                        <div class="dash-card">
                            <div class="icon-card bg-warning">
                                <i class="bi bi-bell"></i>
                            </div>
                            <div class="card-content">
                                <h3>Notificaciones</h3>
                                <p class="valor">3 <span class="badge bg-success">+12%</span></p>
                            </div>
                        </div>
                    </section>
                    
                    <!-- Sección Problemas -->
                    <section class="problemas-container">
                        <div class="dash-card lista-problemas">
                            <h2><i class="bi bi-exclamation-triangle"></i> Problemas Recientes</h2>
                            <ul class="problemas-list">
                                <li class="problema-item">
                                    <span class="categoria logispea">Logispea</span>
                                    <span class="detalle">Error de inventario</span>
                                    <span class="badge bg-danger">Urgente</span>
                                </li>
                                <!-- Más items... -->
                            </ul>
                        </div>
                    </section>
                    
                </div>
            </main>
        </div>
    </div>

    <%@include file="/includes/admin-footer.jsp" %>
    
    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>