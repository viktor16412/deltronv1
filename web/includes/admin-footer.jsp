<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="admin-footer mt-auto py-3 bg-light">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <span class="text-muted">
                    &copy; <%= java.time.Year.now().getValue() %> DELTRON - Sistema de Administración
                </span>
            </div>
            <div class="col-md-6 text-end">
                <span class="text-muted">
                    Versión 2.1.0 | Último acceso: 
                    <%= session.getAttribute("ultimo_login") != null ? 
                        session.getAttribute("ultimo_login") : "N/A" %>
                </span>
            </div>
        </div>
    </div>
</footer>