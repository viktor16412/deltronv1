CREATE DATABASE IF NOT EXISTS deltronV2;
USE deltronV2;
CREATE TABLE USUARIOS (
  IDUSUARIO CHAR(36) PRIMARY KEY,
  USUARIO VARCHAR(50) NOT NULL UNIQUE,
  CONTRASENA VARCHAR(255) NOT NULL,
  NOMBRE VARCHAR(100) NOT NULL,
  EMAIL VARCHAR(100),
  ROL VARCHAR(20) NOT NULL DEFAULT 'USUARIO', -- ADMIN, INVENTARIO, VENTAS, COMPRAS, CONSULTA
  ACTIVO TINYINT(1) DEFAULT 1,
  FECHA_CREACION DATETIME DEFAULT CURRENT_TIMESTAMP,
  ULTIMO_LOGIN DATETIME,
  TELEFONO VARCHAR(20),
  ULTIMA_ACTIVIDAD DATETIME,
  INTENTOS_FALLIDOS INT DEFAULT 0,
  BLOQUEADO TINYINT(1) DEFAULT 0
);

CREATE TABLE ROLES (
  IDROL CHAR(36) PRIMARY KEY,
  NOMBRE VARCHAR(50) NOT NULL,
  DESCRIPCION VARCHAR(200)
);
-- 1. Usuario Administrador
INSERT INTO USUARIOS (
    IDUSUARIO, 
    USUARIO, 
    CONTRASENA, 
    NOMBRE, 
    EMAIL, 
    ROL, 
    ACTIVO,
    FECHA_CREACION,
    ULTIMO_LOGIN,
    TELEFONO,
    ULTIMA_ACTIVIDAD,
    INTENTOS_FALLIDOS,
    BLOQUEADO
) VALUES (
    UUID(),
    'admin',
    '$2a$10$N9qo8uLOickgx2ZMRZoMy.MH/r7r6Lf5Q4FbT7X8/QNQY7W5fRqO6',
    'Administrador del Sistema',
    'admin@deltron.com',
    'ADMIN',
    1,
    NOW(),
    NULL,
    '+51987654321',
    NOW(),
    0,
    0
);
-- 2. Jefe de Inventario
INSERT INTO USUARIOS (
    IDUSUARIO, 
    USUARIO, 
    CONTRASENA, 
    NOMBRE, 
    EMAIL, 
    ROL, 
    ACTIVO,
    FECHA_CREACION,
    ULTIMO_LOGIN,
    TELEFONO,
    ULTIMA_ACTIVIDAD,
    INTENTOS_FALLIDOS,
    BLOQUEADO
) VALUES (
    UUID(),
    'jefe.inventario',
    '$2a$10$N9qo8uLOickgx2ZMRZoMy.MH/r7r6Lf5Q4FbT7X8/QNQY7W5fRqO6',
    'Jorge Pérez - Jefe de Inventario',
    'jperez@deltron.com',
    'INVENTARIO',
    1,
    NOW(),
    NOW(),
    '+51988776655',
    NOW(),
    0,
    0
);
-- 3. Vendedor
INSERT INTO USUARIOS (
    IDUSUARIO, 
    USUARIO, 
    CONTRASENA, 
    NOMBRE, 
    EMAIL, 
    ROL, 
    ACTIVO,
    FECHA_CREACION,
    ULTIMO_LOGIN,
    TELEFONO,
    ULTIMA_ACTIVIDAD,
    INTENTOS_FALLIDOS,
    BLOQUEADO
) VALUES (
    UUID(),
    'vendedor1',
    '$2a$10$N9qo8uLOickgx2ZMRZoMy.MH/r7r6Lf5Q4FbT7X8/QNQY7W5fRqO6',
    'María González - Vendedora',
    'mgonzalez@deltron.com',
    'VENTAS',
    1,
    NOW(),
    DATE_SUB(NOW(), INTERVAL 2 HOUR),
    '+51977665544',
    DATE_SUB(NOW(), INTERVAL 30 MINUTE),
    0,
    0
);
-- 4. Asistente de Compras
INSERT INTO USUARIOS (
    IDUSUARIO, 
    USUARIO, 
    CONTRASENA, 
    NOMBRE, 
    EMAIL, 
    ROL, 
    ACTIVO,
    FECHA_CREACION,
    ULTIMO_LOGIN,
    TELEFONO,
    ULTIMA_ACTIVIDAD,
    INTENTOS_FALLIDOS,
    BLOQUEADO
) VALUES (
    UUID(),
    'asist.compras',
    '$2a$10$N9qo8uLOickgx2ZMRZoMy.MH/r7r6Lf5Q4FbT7X8/QNQY7W5fRqO6',
    'Carlos Rojas - Asistente de Compras',
    'crojas@deltron.com',
    'COMPRAS',
    1,
    NOW(),
    DATE_SUB(NOW(), INTERVAL 1 DAY),
    '+51966554433',
    DATE_SUB(NOW(), INTERVAL 3 HOUR),
    0,
    0
);
-- 5. Auditor (solo consulta)
INSERT INTO USUARIOS (
    IDUSUARIO, 
    USUARIO, 
    CONTRASENA, 
    NOMBRE, 
    EMAIL, 
    ROL, 
    ACTIVO,
    FECHA_CREACION,
    ULTIMO_LOGIN,
    TELEFONO,
    ULTIMA_ACTIVIDAD,
    INTENTOS_FALLIDOS,
    BLOQUEADO
) VALUES (
    UUID(),
    'auditor1',
    '$2a$10$N9qo8uLOickgx2ZMRZoMy.MH/r7r6Lf5Q4FbT7X8/QNQY7W5fRqO6',
    'Laura Méndez - Auditora',
    'lmendez@deltron.com',
    'CONSULTA',
    1,
    NOW(),
    DATE_SUB(NOW(), INTERVAL 3 DAY),
    '+51955443322',
    DATE_SUB(NOW(), INTERVAL 2 DAY),
    0,
    0
);
-- 6. Usuario Bloqueado data de ejemplo
INSERT INTO USUARIOS (
    IDUSUARIO, 
    USUARIO, 
    CONTRASENA, 
    NOMBRE, 
    EMAIL, 
    ROL, 
    ACTIVO,
    FECHA_CREACION,
    ULTIMO_LOGIN,
    TELEFONO,
    ULTIMA_ACTIVIDAD,
    INTENTOS_FALLIDOS,
    BLOQUEADO
) VALUES (
    UUID(),
    'exempleado',
    '$2a$10$N9qo8uLOickgx2ZMRZoMy.MH/r7r6Lf5Q4FbT7X8/QNQY7W5fRqO6',
    'Ex Empleado',
    'ex@deltron.com',
    'USUARIO',
    0,
    DATE_SUB(NOW(), INTERVAL 6 MONTH),
    DATE_SUB(NOW(), INTERVAL 3 MONTH),
    '+51999887766',
    DATE_SUB(NOW(), INTERVAL 3 MONTH),
    5,
    1
);

INSERT INTO ROLES VALUES 
(UUID(), 'ADMIN', 'Administrador del sistema con todos los permisos'),
(UUID(), 'INVENTARIO', 'Gestiona productos y movimientos de almacén'),
(UUID(), 'VENTAS', 'Puede realizar ventas y consultar inventario'),
(UUID(), 'COMPRAS', 'Puede realizar compras y consultar inventario'),
(UUID(), 'CONSULTA', 'Solo permisos de lectura');

select * from USUARIOS;

-- Password123