<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deltron | Tecnología y Computación</title>
    
    <!-- Sección de los CSS --> 
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/products.css">
    <link rel="stylesheet" href="assets/css/features.css">
    
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <!-- Sección de los CSS --> 
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
</head>

<body>
    <!-- Sección del Header --> 
    <%@include file="/includes/header.jsp" %>
    <!-- Sección del Header --> 
    
    <main class="container-fluid px-0">
        
    <!-- Sección de Banner con Carrusel --> 
        <section class="hero-carousel deltron-bg">
            <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=1800&q=80" class="d-block w-100" alt="Ofertas en laptops">
                        <div class="carousel-caption">
                            <h2 class="display-4 fw-bold">TECNOLOGÍA DE ÚLTIMA GENERACIÓN</h2>
                            <p class="lead">Hasta 30% de descuento en laptops gamer</p>
                            <a href="#productos" class="btn btn-lg btn-primary rounded-pill px-4">Ver ofertas</a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=1800&q=80" class="d-block w-100" alt="Componentes de computadoras">
                        <div class="carousel-caption">
                            <h2 class="display-4 fw-bold">COMPONENTES DE CALIDAD</h2>
                            <p class="lead">Los mejores precios en hardware</p>
                            <a href="#productos" class="btn btn-lg btn-primary rounded-pill px-4">Comprar ahora</a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=1800&q=80" class="d-block w-100" alt="Accesorios tecnológicos">
                        <div class="carousel-caption">
                            <h2 class="display-4 fw-bold">ACCESORIOS TECNOLÓGICOS</h2>
                            <p class="lead">Todo lo que necesitas en un solo lugar</p>
                            <a href="#productos" class="btn btn-lg btn-primary rounded-pill px-4">Explorar</a>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </button>
            </div>
        </section>
    <!-- Sección de Banner con Carrusel -->
    
    <!-- Sección de Categorías Rápidas -->
    <section class="quick-categories deltron-bg-light">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-3 col-6">
                    <a href="#" class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-laptop"></i>
                        </div>
                        <h3>Laptops</h3>
                    </a>
                </div>
                <div class="col-md-3 col-6">
                    <a href="#" class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-pc-display"></i>
                        </div>
                        <h3>Computadoras</h3>
                    </a>
                </div>
                <div class="col-md-3 col-6">
                    <a href="#" class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-tablet"></i>
                        </div>
                        <h3>Tablets</h3>
                    </a>
                </div>
                <div class="col-md-3 col-6">
                    <a href="#" class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-usb-drive"></i>
                        </div>
                        <h3>Almacenamiento</h3>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Sección de Categorías Rápidas -->
    
    <!-- Seccion de Productos -->
        <section id="productos" class="products-section">
            <div class="container">
                <div class="section-header">
                    <h2>Productos <span>Destacados</span></h2>
                    <div class="category-filter">
                        <select class="form-select" aria-label="Filtrar por categoría">
                            <option selected>Todas las categorías</option>
                            <option value="1">Laptops</option>
                            <option value="2">Computadoras</option>
                            <option value="3">Tablets</option>
                            <option value="4">Almacenamiento</option>
                            <option value="5">Accesorios</option>
                        </select>
                    </div>
                </div>
                <div class="products-grid" id="productos-container">
                    <!-- Productos cargados dinámicamente -->
                </div>
            </div>
        </section>
    <!-- Seccion de Productos -->
    
    <!-- Seccion de Beneficios -->
        <section class="benefits-section deltron-bg-light">
    <div class="container">
        <div class="benefits-content">
            <div class="benefits-image">
                <img src="https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" 
                     alt="Beneficios Deltron" class="img-fluid rounded">
            </div>
            <div class="benefits-list">
                <h2 class="text-deltron-primary">¿Por qué elegir <span class="text-deltron-accent">Deltron</span>?</h2>
                <div class="benefit-item">
                    <div class="benefit-icon text-deltron-accent">
                        <i class="bi bi-check-circle-fill"></i>
                    </div>
                    <div class="benefit-text">
                        <h3 class="text-deltron-primary">Tecnología de Calidad</h3>
                        <p class="text-deltron-secondary">Trabajamos con las mejores marcas del mercado tecnológico.</p>
                    </div>
                </div>
                <div class="benefit-item">
                    <div class="benefit-icon text-deltron-accent">
                        <i class="bi bi-check-circle-fill"></i>
                    </div>
                    <div class="benefit-text">
                        <h3 class="text-deltron-primary">Garantía Extendida</h3>
                        <p class="text-deltron-secondary">Todos nuestros productos incluyen garantía oficial del fabricante.</p>
                    </div>
                </div>
                <div class="benefit-item">
                    <div class="benefit-icon text-deltron-accent">
                        <i class="bi bi-check-circle-fill"></i>
                    </div>
                    <div class="benefit-text">
                        <h3 class="text-deltron-primary">Soporte Técnico</h3>
                        <p class="text-deltron-secondary">Asesoramiento especializado antes y después de tu compra.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </section>
    <!-- Seccion de Beneficios -->
    
    <!-- Sección de Marcas -->
    <section class="brands-section py-5 bg-white">
    <div class="container">
        <h2 class="text-center fw-bold mb-5 text-deltron-primary">Marcas <span class="text-deltron-accent">Destacadas</span></h2>
        
        <div class="brands-grid">
            <div class="brand-item">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/1200px-HP_logo_2012.svg.png" alt="ASUS" class="img-fluid">
            </div>
            <div class="brand-item">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/1200px-HP_logo_2012.svg.png" alt="HP">
            </div>
            <div class="brand-item">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Dell_logo_2016.svg/1200px-Dell_logo_2016.svg.png" alt="DELL">
            </div>
            <div class="brand-item">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/1200px-HP_logo_2012.svg.png" alt="LENOVO">
            </div>
            <div class="brand-item">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/1200px-HP_logo_2012.svg.png" alt="ACER">
            </div>
        </div>
    </div>
</section>
    <!-- Sección de Marcas -->
    
    <!-- CTA -->
        <section class="cta-section deltron-bg-dark">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h2>¿Necesitas asesoramiento técnico?</h2>
                        <p>Nuestros expertos están listos para ayudarte a encontrar el equipo perfecto para tus necesidades.</p>
                    </div>
                    <div class="col-md-4 text-end">
                        <a href="#contacto" class="btn btn-outline-light btn-lg">Contáctanos</a>
                    </div>
                </div>
            </div>
        </section>
    <!-- CTA -->
    
    <!-- Sección del Footer --> 
    <%@include file="includes/footer.jsp" %>
    <!-- Sección del Footer --> 
    
    <!-- Sección de los Java Script --> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/products.js"></script>   
    <!-- Sección de los Java Script --> 
</body>    
</html>