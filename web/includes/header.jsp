<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="deltron-header">
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <!-- Logo -->
            <a class="navbar-brand" href="index.jsp">
                <h1>DELTRON</h1>
                <span>Tecnología y Computación</span>
            </a>
            
            <!-- Botón Mobile -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <!-- Menú Principal -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link ${pageContext.request.requestURI.endsWith('/index.jsp') ? 'active' : ''}" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            Productos
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="products.jsp?category=laptops"><i class="bi bi-laptop me-2"></i> Laptops</a></li>
                            <li><a class="dropdown-item" href="products.jsp?category=computers"><i class="bi bi-pc-display me-2"></i> Computadoras</a></li>
                            <li><a class="dropdown-item" href="products.jsp?category=tablets"><i class="bi bi-tablet me-2"></i> Tablets</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="products.jsp"><i class="bi bi-grid me-2"></i> Todos los productos</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="services.jsp">Servicios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="support.jsp">Soporte</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contacto</a>
                    </li>
                </ul>
                
                <!-- Contenedor de Acciones - Ahora con flexbox para alinear horizontalmente -->
                <div class="header-actions d-flex align-items-center ms-lg-4 mt-3 mt-lg-0">
                    <!-- Dropdown de Usuario -->
                    <div class="dropdown me-2"> <!-- Añadido margen derecho -->
                        <button class="btn btn-outline-light dropdown-toggle d-flex align-items-center" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle me-1"></i>
                            <span class="d-none d-md-inline">Mi Cuenta</span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <% if (session.getAttribute("user") == null) { %>
                                <li><a class="dropdown-item" href="login.jsp"><i class="bi bi-box-arrow-in-right me-2"></i> Iniciar Sesión</a></li>
                                <li><a class="dropdown-item" href="register.jsp"><i class="bi bi-person-plus me-2"></i> Registrarse</a></li>
                            <% } else { %>
                                <li><span class="dropdown-item-text">Bienvenido, <%= session.getAttribute("userName") %></span></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="account.jsp"><i class="bi bi-person me-2"></i> Mi Perfil</a></li>
                                <li><a class="dropdown-item" href="orders.jsp"><i class="bi bi-receipt me-2"></i> Mis Pedidos</a></li>
                                <li><a class="dropdown-item" href="wishlist.jsp"><i class="bi bi-heart me-2"></i> Favoritos</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="LogoutServlet"><i class="bi bi-box-arrow-right me-2"></i> Cerrar Sesión</a></li>
                            <% } %>
                        </ul>
                    </div>
                    
                    <!-- Carrito con indicador - Ahora en la misma línea -->
                    <a href="cart.jsp" class="btn btn-outline-light position-relative">
                        <i class="bi bi-cart"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                            <% if (session.getAttribute("cartCount") != null) { %>
                                <%= session.getAttribute("cartCount") %>
                            <% } else { %>
                                0
                            <% } %>
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>

