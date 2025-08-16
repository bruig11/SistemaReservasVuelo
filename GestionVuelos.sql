create database GetionVuelos

-- Tabla Aerolinea
CREATE TABLE Aerolinea (
    idAerolinea INT PRIMARY KEY NOT NULL,
    nombreAerolinea VARCHAR(100) NOT NULL,
    codigoAerolinea VARCHAR(3) NOT NULL UNIQUE
);

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    documentoIdentificacion VARCHAR(20) NOT NULL UNIQUE
);

-- Tabla Emails
CREATE TABLE Emails (
    idEmail INT PRIMARY KEY NOT NULL,
    idCliente INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    UNIQUE (idCliente, email)
);

-- Tabla Telefonos
CREATE TABLE Telefonos (
    idTelefono INT PRIMARY KEY NOT NULL,
    idCliente INT NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    UNIQUE (idCliente, telefono)
);

-- Tabla Aeropuerto
CREATE TABLE Aeropuerto (
    idAeropuerto INT PRIMARY KEY NOT NULL,
    codigoAeropuerto VARCHAR(3) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

-- Tabla Vuelo
CREATE TABLE Vuelo (
    idVuelo INT PRIMARY KEY NOT NULL,
    idAerolinea INT NOT NULL,
    idAeropuertoOrigen INT NOT NULL,
    idAeropuertoDestino INT NOT NULL,
    numeroVuelo VARCHAR(10) NOT NULL,
    fechaSalida DATE NOT NULL,
    horaSalida TIME NOT NULL,
    fechaLlegada DATE NOT NULL,
    horaLlegada TIME NOT NULL,
    precioBase DECIMAL(10,2) NOT NULL,
    asientosDisponibles INT NOT NULL,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (idAerolinea) REFERENCES Aerolinea(idAerolinea),
    FOREIGN KEY (idAeropuertoOrigen) REFERENCES Aeropuerto(idAeropuerto),
    FOREIGN KEY (idAeropuertoDestino) REFERENCES Aeropuerto(idAeropuerto),
    UNIQUE (numeroVuelo, fechaSalida, horaSalida)
);

-- Tabla Reserva
CREATE TABLE Reserva (
    idReserva INT PRIMARY KEY NOT NULL,
    idCliente INT NOT NULL,
    idVuelo INT NOT NULL,
    fechaReserva DATETIME NOT NULL,
    codigoConfirmacion VARCHAR(20) NOT NULL UNIQUE,
    estadoReserva VARCHAR(20) NOT NULL,
    numeroAsiento VARCHAR(10) NOT NULL,
    precioTotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idVuelo) REFERENCES Vuelo(idVuelo),
    UNIQUE (idVuelo, numeroAsiento)
);

-- Tabla Facturacion
CREATE TABLE Facturacion (
    idFacturacion INT PRIMARY KEY NOT NULL,
    idReserva INT NOT NULL,
    numeroFactura VARCHAR(20) NOT NULL UNIQUE,
    fechaEmision DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    metodoPago VARCHAR(50) NOT NULL,
    FOREIGN KEY (idReserva) REFERENCES Reserva(idReserva)
);

INSERT INTO Aerolinea (idAerolinea, nombreAerolinea, codigoAerolinea) VALUES
(1, 'Avianca', 'AV'),
(2, 'Copa Airlines', 'CM'),
(3, 'American Airlines', 'AA'),
(4, 'Delta Air Lines', 'DL'),
(5, 'United Airlines', 'UA'),
(6, 'LATAM Airlines', 'LA'),
(7, 'JetBlue Airways', 'B6'),
(8, 'Southwest Airlines', 'WN'),
(9, 'Spirit Airlines', 'NK'),
(10, 'Volaris Costa Rica', 'Q6'),
(11, 'Iberia', 'IB'),
(12, 'Air France', 'AF'),
(13, 'KLM', 'KL'),
(14, 'Lufthansa', 'LH'),
(15, 'British Airways', 'BA'),
(16, 'Turkish Airlines', 'TK'),
(17, 'Emirates', 'EK'),
(18, 'Qatar Airways', 'QR'),
(19, 'Singapore Airlines', 'SQ'),
(20, 'Cathay Pacific', 'CX');

-- INSERT para tabla Cliente (usando los nombres del documento)
INSERT INTO Cliente (idCliente, nombre, apellido1, apellido2, documentoIdentificacion) VALUES
(1, 'Samuel Antonio', 'Aguilar', 'Espinoza', '504630970'),
(2, 'Oscar Daniel', 'Aguilar', 'Rodríguez', '208840146'),
(3, 'Marypaz', 'Alfaro', 'Chaves', '208890537'),
(4, 'Jose Daniel', 'Arana', 'Montoya', '208970095'),
(5, 'Jean Pierre', 'Araya', 'Vargas', '208710333'),
(6, 'Kristel Fiorella', 'Barquero', 'Arias', '119530032'),
(7, 'Sebastián', 'Benavides', 'Ramírez', '208770520'),
(8, 'Fabian', 'Bolaños', 'Murillo', '208720867'),
(9, 'Jeffry Andriy', 'Campos', 'Hurtado', '208620562'),
(10, 'Nigel Josue', 'Castillo', 'Rocha', '208780247'),
(11, 'Fabricio', 'Castro', 'Vega', '208770649'),
(12, 'Johan Dario', 'Fernandez', 'Campos', '208810742'),
(13, 'Barbara Montserrat', 'Garay', 'Ruiz', '402670001'),
(14, 'Jainer Said', 'Garcia', 'Gonzalez', '208920683'),
(15, 'Kevin Esteban', 'Gomez', 'Mendoza', '208720584'),
(16, 'Joseph Steven', 'Gonzalez', 'Bello', '119420709'),
(17, 'Kiany Daney', 'Granados', 'Diaz', '703270758'),
(18, 'Brisly Esperanza', 'Hurtado', 'Vindas', '208860205'),
(19, 'Esteban Alberto', 'Molina', 'Meza', '208780161'),
(20, 'Yader Isith', 'Mora', 'Mejias', '605030048');

-- INSERT para tabla Emails
INSERT INTO Emails (idEmail, idCliente, email) VALUES
(1, 1, 'samuel.aguilar@email.com'),
(2, 2, 'oscar.aguilar@email.com'),
(3, 3, 'marypaz.alfaro@email.com'),
(4, 4, 'jose.arana@email.com'),
(5, 5, 'jean.araya@email.com'),
(6, 6, 'kristel.barquero@email.com'),
(7, 7, 'sebastian.benavides@email.com'),
(8, 8, 'fabian.bolanos@email.com'),
(9, 9, 'jeffry.campos@email.com'),
(10, 10, 'nigel.castillo@email.com'),
(11, 11, 'fabricio.castro@email.com'),
(12, 12, 'johan.fernandez@email.com'),
(13, 13, 'barbara.garay@email.com'),
(14, 14, 'jainer.garcia@email.com'),
(15, 15, 'kevin.gomez@email.com'),
(16, 16, 'joseph.gonzalez@email.com'),
(17, 17, 'kiany.granados@email.com'),
(18, 18, 'brisly.hurtado@email.com'),
(19, 19, 'esteban.molina@email.com'),
(20, 20, 'yader.mora@email.com');

-- INSERT para tabla Telefonos
INSERT INTO Telefonos (idTelefono, idCliente, telefono) VALUES
(1, 1, '+506 8888-1001'),
(2, 2, '+506 8888-1002'),
(3, 3, '+506 8888-1003'),
(4, 4, '+506 8888-1004'),
(5, 5, '+506 8888-1005'),
(6, 6, '+506 8888-1006'),
(7, 7, '+506 8888-1007'),
(8, 8, '+506 8888-1008'),
(9, 9, '+506 8888-1009'),
(10, 10, '+506 8888-1010'),
(11, 11, '+506 8888-1011'),
(12, 12, '+506 8888-1012'),
(13, 13, '+506 8888-1013'),
(14, 14, '+506 8888-1014'),
(15, 15, '+506 8888-1015'),
(16, 16, '+506 8888-1016'),
(17, 17, '+506 8888-1017'),
(18, 18, '+506 8888-1018'),
(19, 19, '+506 8888-1019'),
(20, 20, '+506 8888-1020');

-- INSERT para tabla Aeropuerto
INSERT INTO Aeropuerto (idAeropuerto, codigoAeropuerto, nombre, ciudad, pais) VALUES
(1, 'SJO', 'Aeropuerto Internacional Juan Santamaría', 'San José', 'Costa Rica'),
(2, 'LIR', 'Aeropuerto Internacional Daniel Oduber Quirós', 'Liberia', 'Costa Rica'),
(3, 'LAX', 'Los Angeles International Airport', 'Los Angeles', 'Estados Unidos'),
(4, 'MIA', 'Miami International Airport', 'Miami', 'Estados Unidos'),
(5, 'JFK', 'John F. Kennedy International Airport', 'Nueva York', 'Estados Unidos'),
(6, 'PTY', 'Aeropuerto Internacional de Tocumen', 'Ciudad de Panamá', 'Panamá'),
(7, 'BOG', 'Aeropuerto Internacional El Dorado', 'Bogotá', 'Colombia'),
(8, 'LIM', 'Aeropuerto Internacional Jorge Chávez', 'Lima', 'Perú'),
(9, 'SCL', 'Aeropuerto Arturo Merino Benítez', 'Santiago', 'Chile'),
(10, 'GUA', 'Aeropuerto Internacional La Aurora', 'Ciudad de Guatemala', 'Guatemala'),
(11, 'SAL', 'Aeropuerto Internacional Monseñor Óscar Arnulfo Romero', 'San Salvador', 'El Salvador'),
(12, 'TGU', 'Aeropuerto Internacional Toncontín', 'Tegucigalpa', 'Honduras'),
(13, 'MGA', 'Aeropuerto Internacional Augusto C. Sandino', 'Managua', 'Nicaragua'),
(14, 'MAD', 'Aeropuerto Adolfo Suárez Madrid-Barajas', 'Madrid', 'España'),
(15, 'CDG', 'Aeropuerto Charles de Gaulle', 'París', 'Francia'),
(16, 'AMS', 'Aeropuerto de Ámsterdam-Schiphol', 'Ámsterdam', 'Países Bajos'),
(17, 'FRA', 'Aeropuerto de Fráncfort', 'Fráncfort', 'Alemania'),
(18, 'LHR', 'Aeropuerto de Heathrow', 'Londres', 'Reino Unido'),
(19, 'IST', 'Aeropuerto de Estambul', 'Estambul', 'Turquía'),
(20, 'DXB', 'Aeropuerto Internacional de Dubái', 'Dubái', 'Emiratos Árabes Unidos');

-- INSERT para tabla Vuelo
INSERT INTO Vuelo (idVuelo, idAerolinea, idAeropuertoOrigen, idAeropuertoDestino, numeroVuelo, fechaSalida, horaSalida, fechaLlegada, horaLlegada, precioBase, asientosDisponibles, estado) VALUES
(1, 1, 1, 4, 'AV532', '2025-05-13', '08:00:00', '2025-05-13', '14:30:00', 450.00, 120, 'Activo'),
(2, 2, 1, 6, 'CM302', '2025-05-13', '10:15:00', '2025-05-13', '11:45:00', 180.00, 150, 'Activo'),
(3, 3, 1, 3, 'AA1205', '2025-05-13', '11:30:00', '2025-05-13', '19:20:00', 520.00, 180, 'Activo'),
(4, 1, 1, 7, 'AV645', '2025-05-14', '09:00:00', '2025-05-14', '12:15:00', 380.00, 140, 'Activo'),
(5, 4, 1, 5, 'DL425', '2025-05-14', '15:45:00', '2025-05-15', '06:30:00', 680.00, 200, 'Activo'),
(6, 5, 2, 4, 'UA892', '2025-05-13', '12:00:00', '2025-05-13', '18:45:00', 490.00, 160, 'Activo'),
(7, 6, 1, 8, 'LA603', '2025-05-13', '16:30:00', '2025-05-13', '21:20:00', 420.00, 170, 'Activo'),
(8, 2, 6, 1, 'CM303', '2025-05-14', '13:20:00', '2025-05-14', '14:50:00', 185.00, 145, 'Activo'),
(9, 7, 1, 5, 'B6745', '2025-05-15', '07:15:00', '2025-05-15', '15:40:00', 550.00, 130, 'Activo'),
(10, 1, 7, 1, 'AV646', '2025-05-15', '14:30:00', '2025-05-15', '17:45:00', 385.00, 135, 'Activo'),
(11, 8, 1, 4, 'WN1234', '2025-05-13', '13:45:00', '2025-05-13', '20:15:00', 320.00, 190, 'Activo'),
(12, 9, 2, 3, 'NK567', '2025-05-14', '11:20:00', '2025-05-14', '19:50:00', 410.00, 175, 'Activo'),
(13, 6, 1, 9, 'LA805', '2025-05-14', '22:30:00', '2025-05-15', '08:15:00', 620.00, 165, 'Activo'),
(14, 11, 1, 14, 'IB6805', '2025-05-13', '20:45:00', '2025-05-14', '16:30:00', 890.00, 280, 'Activo'),
(15, 12, 1, 15, 'AF480', '2025-05-14', '21:15:00', '2025-05-15', '18:40:00', 950.00, 290, 'Activo'),
(16, 1, 1, 10, 'AV234', '2025-05-13', '14:20:00', '2025-05-13', '15:50:00', 220.00, 120, 'Activo'),
(17, 2, 1, 11, 'CM156', '2025-05-14', '16:40:00', '2025-05-14', '18:25:00', 240.00, 140, 'Activo'),
(18, 1, 1, 12, 'AV789', '2025-05-15', '09:30:00', '2025-05-15', '11:40:00', 280.00, 125, 'Activo'),
(19, 13, 1, 16, 'KL642', '2025-05-13', '19:20:00', '2025-05-14', '17:15:00', 920.00, 285, 'Activo'),
(20, 15, 1, 18, 'BA215', '2025-05-14', '23:10:00', '2025-05-15', '19:55:00', 980.00, 310, 'Activo');

-- INSERT para tabla Reserva
INSERT INTO Reserva (idReserva, idCliente, idVuelo, fechaReserva, codigoConfirmacion, estadoReserva, numeroAsiento, precioTotal) VALUES
(1, 1, 1, '2025-05-13 14:00:00', 'CONF001SAM', 'Confirmada', '12A', 450.00),
(2, 2, 2, '2025-05-13 15:00:00', 'CONF002OSC', 'Confirmada', '15B', 180.00),
(3, 3, 3, '2025-05-13 09:30:00', 'CONF003MAR', 'Confirmada', '8C', 520.00),
(4, 4, 4, '2025-05-13 13:00:00', 'CONF004JOS', 'Confirmada', '22A', 380.00),
(5, 5, 5, '2025-05-13 13:30:00', 'CONF005JEA', 'Confirmada', '5D', 680.00),
(6, 6, 6, '2025-05-13 14:00:00', 'CONF006KRI', 'Confirmada', '18F', 490.00),
(7, 7, 7, '2025-05-13 11:00:00', 'CONF007SEB', 'Confirmada', '10B', 420.00),
(8, 8, 8, '2025-05-14 13:30:00', 'CONF008FAB', 'Confirmada', '25C', 185.00),
(9, 9, 9, '2025-05-13 13:30:00', 'CONF009JEF', 'Confirmada', '7A', 550.00),
(10, 10, 10, '2025-05-13 13:30:00', 'CONF010NIG', 'Confirmada', '14E', 385.00),
(11, 11, 11, '2025-05-13 15:00:00', 'CONF011FAB', 'Confirmada', '20D', 320.00),
(12, 12, 12, '2025-05-13 13:00:00', 'CONF012JOH', 'Confirmada', '3B', 410.00),
(13, 13, 13, '2025-05-13 14:30:00', 'CONF013BAR', 'Confirmada', '11F', 620.00),
(14, 14, 14, '2025-05-13 15:00:00', 'CONF014JAI', 'Confirmada', '28A', 890.00),
(15, 15, 15, '2025-05-13 14:30:00', 'CONF015KEV', 'Confirmada', '35C', 950.00),
(16, 16, 16, '2025-05-13 13:30:00', 'CONF016JOS', 'Confirmada', '9A', 220.00),
(17, 17, 17, '2025-05-13 13:00:00', 'CONF017KIA', 'Confirmada', '16B', 240.00),
(18, 18, 18, '2025-05-13 13:30:00', 'CONF018BRI', 'Confirmada', '13D', 280.00),
(19, 19, 19, '2025-05-13 16:00:00', 'CONF019EST', 'Confirmada', '42F', 920.00),
(20, 20, 20, '2025-05-13 15:30:00', 'CONF020YAD', 'Confirmada', '31E', 980.00);

-- INSERT para tabla Facturacion
INSERT INTO Facturacion (idFacturacion, idReserva, numeroFactura, fechaEmision, total, metodoPago) VALUES
(1, 1, 'FACT-2025-001', '2025-05-13', 450.00, 'Tarjeta de Crédito'),
(2, 2, 'FACT-2025-002', '2025-05-13', 180.00, 'Tarjeta de Débito'),
(3, 3, 'FACT-2025-003', '2025-05-13', 520.00, 'Transferencia Bancaria'),
(4, 4, 'FACT-2025-004', '2025-05-13', 380.00, 'Tarjeta de Crédito'),
(5, 5, 'FACT-2025-005', '2025-05-13', 680.00, 'PayPal'),
(6, 6, 'FACT-2025-006', '2025-05-13', 490.00, 'Tarjeta de Crédito'),
(7, 7, 'FACT-2025-007', '2025-05-13', 420.00, 'Tarjeta de Débito'),
(8, 8, 'FACT-2025-008', '2025-05-14', 185.00, 'Efectivo'),
(9, 9, 'FACT-2025-009', '2025-05-13', 550.00, 'Tarjeta de Crédito'),
(10, 10, 'FACT-2025-010', '2025-05-13', 385.00, 'Transferencia Bancaria'),
(11, 11, 'FACT-2025-011', '2025-05-13', 320.00, 'Tarjeta de Crédito'),
(12, 12, 'FACT-2025-012', '2025-05-13', 410.00, 'Tarjeta de Débito'),
(13, 13, 'FACT-2025-013', '2025-05-13', 620.00, 'PayPal'),
(14, 14, 'FACT-2025-014', '2025-05-13', 890.00, 'Tarjeta de Crédito'),
(15, 15, 'FACT-2025-015', '2025-05-13', 950.00, 'Transferencia Bancaria'),
(16, 16, 'FACT-2025-016', '2025-05-13', 220.00, 'Tarjeta de Débito'),
(17, 17, 'FACT-2025-017', '2025-05-13', 240.00, 'Efectivo'),
(18, 18, 'FACT-2025-018', '2025-05-13', 280.00, 'Tarjeta de Crédito'),
(19, 19, 'FACT-2025-019', '2025-05-13', 920.00, 'PayPal'),
(20, 20, 'FACT-2025-020', '2025-05-13', 980.00, 'Tarjeta de Crédito');

use GestionVuelos
-- 1. TRIGGERS FUNCIONALES BÁSICOS

-- TRIGGER 1: Validar disponibilidad de asientos al hacer reserva
CREATE OR ALTER TRIGGER tr_ValidarAsientosDisponibles
ON Reserva
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @idVuelo INT, @asientosDisponibles INT, @totalReservas INT;
    
    SELECT @idVuelo = idVuelo FROM inserted;
    
    -- Obtener asientos disponibles del vuelo
    SELECT @asientosDisponibles = asientosDisponibles 
    FROM Vuelo 
    WHERE idVuelo = @idVuelo;
    
    -- Contar total de reservas confirmadas para el vuelo
    SELECT @totalReservas = COUNT(*) 
    FROM Reserva 
    WHERE idVuelo = @idVuelo AND estadoReserva = 'Confirmada';
    
    -- Validar que no se exceda la capacidad
    IF @totalReservas > @asientosDisponibles
    BEGIN
        RAISERROR('Error: No hay asientos disponibles en el vuelo. Disponibles: %d, Reservas: %d', 16, 1, @asientosDisponibles, @totalReservas);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- Actualizar asientos disponibles
        UPDATE Vuelo 
        SET asientosDisponibles = @asientosDisponibles - @totalReservas
        WHERE idVuelo = @idVuelo;
        
        PRINT 'Reserva procesada correctamente. Asientos disponibles actualizados.';
    END
END;
GO

-- TRIGGER 2: Generar facturación automática al confirmar reserva
CREATE OR ALTER TRIGGER tr_GenerarFacturacion
ON Reserva
AFTER INSERT
AS
BEGIN
    DECLARE @idReserva INT, @precioTotal DECIMAL(10,2), @numeroFactura VARCHAR(20);
    
    SELECT @idReserva = idReserva, @precioTotal = precioTotal 
    FROM inserted 
    WHERE estadoReserva = 'Confirmada';
    
    IF @idReserva IS NOT NULL
    BEGIN
        -- Generar número de factura único
        SET @numeroFactura = 'FACT-' + CAST(YEAR(GETDATE()) AS VARCHAR(4)) + '-' + 
                           RIGHT('000' + CAST(@idReserva AS VARCHAR), 3);
        
        -- Insertar facturación automática
        INSERT INTO Facturacion (idFacturacion, idReserva, numeroFactura, fechaEmision, total, metodoPago)
        VALUES (@idReserva + 1000, @idReserva, @numeroFactura, GETDATE(), @precioTotal, 'Pendiente');
        
        PRINT 'Factura ' + @numeroFactura + ' generada automáticamente.';
    END
END;
GO

-- TRIGGER 3: Auditar cambios de estado de vuelos
CREATE TABLE AuditoriaVuelos (
    idAuditoria INT IDENTITY(1,1) PRIMARY KEY,
    idVuelo INT NOT NULL,
    estadoAnterior VARCHAR(20),
    estadoNuevo VARCHAR(20),
    fechaCambio DATETIME DEFAULT GETDATE(),
    usuario VARCHAR(100) DEFAULT SYSTEM_USER
);
GO

CREATE OR ALTER TRIGGER tr_AuditarEstadoVuelo
ON Vuelo
AFTER UPDATE
AS
BEGIN
    IF UPDATE(estado)
    BEGIN
        INSERT INTO AuditoriaVuelos (idVuelo, estadoAnterior, estadoNuevo)
        SELECT 
            i.idVuelo,
            d.estado AS estadoAnterior,
            i.estado AS estadoNuevo
        FROM inserted i
        INNER JOIN deleted d ON i.idVuelo = d.idVuelo
        WHERE i.estado != d.estado;
        
        PRINT 'Cambio de estado registrado en auditoría.';
    END
END;
GO


-- 2. CREACIÓN DE USUARIOS Y PERMISOS


-- Crear logins y usuarios
CREATE LOGIN administrador_vuelos WITH PASSWORD = 'Admin2024!';
CREATE LOGIN agente_reservas WITH PASSWORD = 'Agente2024!';
CREATE LOGIN cliente_consulta WITH PASSWORD = 'Cliente2024!';

-- Crear usuarios en la base de datos
CREATE USER administrador_vuelos FOR LOGIN administrador_vuelos;
CREATE USER agente_reservas FOR LOGIN agente_reservas;
CREATE USER cliente_consulta FOR LOGIN cliente_consulta;
GO

-- Crear roles personalizados
CREATE ROLE rol_administrador;
CREATE ROLE rol_agente;
CREATE ROLE rol_consulta;
GO

-- Agregar usuarios a roles
ALTER ROLE rol_administrador ADD MEMBER administrador_vuelos;
ALTER ROLE rol_agente ADD MEMBER agente_reservas;
ALTER ROLE rol_consulta ADD MEMBER cliente_consulta;
GO


-- 3. ASIGNACIÓN DE PERMISOS POR ROL


-- PERMISOS PARA ADMINISTRADOR (Acceso total)
GRANT SELECT, INSERT, UPDATE, DELETE ON Aerolinea TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cliente TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Emails TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Telefonos TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Aeropuerto TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Vuelo TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Reserva TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Facturacion TO rol_administrador;
GRANT SELECT ON AuditoriaVuelos TO rol_administrador;

-- PERMISOS PARA AGENTE DE RESERVAS (Operaciones de reservas y consultas)
GRANT SELECT ON Aerolinea TO rol_agente;
GRANT SELECT, INSERT, UPDATE ON Cliente TO rol_agente;
GRANT SELECT, INSERT, UPDATE ON Emails TO rol_agente;
GRANT SELECT, INSERT, UPDATE ON Telefonos TO rol_agente;
GRANT SELECT ON Aeropuerto TO rol_agente;
GRANT SELECT ON Vuelo TO rol_agente;
GRANT SELECT, INSERT, UPDATE ON Reserva TO rol_agente;
GRANT SELECT, INSERT, UPDATE ON Facturacion TO rol_agente;

-- PERMISOS PARA CONSULTA (Solo lectura de información pública)
GRANT SELECT ON Aerolinea TO rol_consulta;
GRANT SELECT ON Aeropuerto TO rol_consulta;
GRANT SELECT ON Vuelo TO rol_consulta;
-- Acceso limitado a reservas (solo sus propias reservas a través de vistas)


-- 4. VISTAS DE SEGURIDAD


-- Vista para consulta pública de vuelos
CREATE OR ALTER VIEW vw_VuelosDisponibles AS
SELECT 
    v.numeroVuelo,
    a.nombreAerolinea,
    ao.nombre + ' (' + ao.codigoAeropuerto + ')' AS aeropuertoOrigen,
    ad.nombre + ' (' + ad.codigoAeropuerto + ')' AS aeropuertoDestino,
    v.fechaSalida,
    v.horaSalida,
    v.fechaLlegada,
    v.horaLlegada,
    v.precioBase,
    v.asientosDisponibles,
    v.estado
FROM Vuelo v
INNER JOIN Aerolinea a ON v.idAerolinea = a.idAerolinea
INNER JOIN Aeropuerto ao ON v.idAeropuertoOrigen = ao.idAeropuerto
INNER JOIN Aeropuerto ad ON v.idAeropuertoDestino = ad.idAeropuerto
WHERE v.estado = 'Activo' AND v.asientosDisponibles > 0;
GO

-- Otorgar permisos en la vista
GRANT SELECT ON vw_VuelosDisponibles TO rol_consulta;


-- 5. CONSULTAS CON JOINS RELEVANTES


-- CONSULTA 1: Información completa de reservas con detalles del vuelo
SELECT 
    r.codigoConfirmacion,
    c.nombre + ' ' + c.apellido1 + ' ' + ISNULL(c.apellido2, '') AS nombreCompleto,
    c.documentoIdentificacion,
    e.email,
    t.telefono,
    a.nombreAerolinea,
    v.numeroVuelo,
    ao.nombre + ' (' + ao.ciudad + ', ' + ao.pais + ')' AS origen,
    ad.nombre + ' (' + ad.ciudad + ', ' + ad.pais + ')' AS destino,
    v.fechaSalida,
    v.horaSalida,
    v.fechaLlegada,
    v.horaLlegada,
    r.numeroAsiento,
    r.precioTotal,
    r.estadoReserva,
    f.numeroFactura,
    f.metodoPago,
    f.fechaEmision
FROM Reserva r
INNER JOIN Cliente c ON r.idCliente = c.idCliente
INNER JOIN Emails e ON c.idCliente = e.idCliente
INNER JOIN Telefonos t ON c.idCliente = t.idCliente
INNER JOIN Vuelo v ON r.idVuelo = v.idVuelo
INNER JOIN Aerolinea a ON v.idAerolinea = a.idAerolinea
INNER JOIN Aeropuerto ao ON v.idAeropuertoOrigen = ao.idAeropuerto
INNER JOIN Aeropuerto ad ON v.idAeropuertoDestino = ad.idAeropuerto
LEFT JOIN Facturacion f ON r.idReserva = f.idReserva
ORDER BY r.fechaReserva DESC;

-- CONSULTA 2: Análisis de ocupación por aerolínea y ruta
SELECT 
    a.nombreAerolinea,
    ao.ciudad + ' → ' + ad.ciudad AS ruta,
    COUNT(v.idVuelo) AS totalVuelos,
    SUM(CASE WHEN v.estado = 'Activo' THEN 1 ELSE 0 END) AS vuelosActivos,
    AVG(CAST(v.asientosDisponibles AS FLOAT)) AS promedioAsientosDisponibles,
    COUNT(r.idReserva) AS totalReservas,
    SUM(r.precioTotal) AS ingresosTotales,
    AVG(r.precioTotal) AS precioPromedio
FROM Aerolinea a
INNER JOIN Vuelo v ON a.idAerolinea = v.idAerolinea
INNER JOIN Aeropuerto ao ON v.idAeropuertoOrigen = ao.idAeropuerto
INNER JOIN Aeropuerto ad ON v.idAeropuertoDestino = ad.idAeropuerto
LEFT JOIN Reserva r ON v.idVuelo = r.idVuelo AND r.estadoReserva = 'Confirmada'
GROUP BY a.nombreAerolinea, ao.ciudad, ad.ciudad
ORDER BY ingresosTotales DESC;

-- CONSULTA 3: Ranking de destinos más populares desde Costa Rica
SELECT 
    ad.ciudad AS destino,
    ad.pais,
    COUNT(r.idReserva) AS numeroReservas,
    AVG(r.precioTotal) AS precioPromedio,
    MIN(r.precioTotal) AS precioMinimo,
    MAX(r.precioTotal) AS precioMaximo,
    STRING_AGG(DISTINCT a.nombreAerolinea, ', ') AS aerolineas,
    RANK() OVER (ORDER BY COUNT(r.idReserva) DESC) AS ranking
FROM Vuelo v
INNER JOIN Aeropuerto ao ON v.idAeropuertoOrigen = ao.idAeropuerto
INNER JOIN Aeropuerto ad ON v.idAeropuertoDestino = ad.idAeropuerto
INNER JOIN Aerolinea a ON v.idAerolinea = a.idAerolinea
INNER JOIN Reserva r ON v.idVuelo = r.idVuelo
WHERE ao.pais = 'Costa Rica' AND r.estadoReserva = 'Confirmada'
GROUP BY ad.ciudad, ad.pais
HAVING COUNT(r.idReserva) > 0
ORDER BY numeroReservas DESC;

-- CONSULTA 4: Resumen financiero por método de pago
SELECT 
    f.metodoPago,
    COUNT(f.idFacturacion) AS numeroTransacciones,
    SUM(f.total) AS montoTotal,
    AVG(f.total) AS montoPromedio,
    MIN(f.total) AS montoMinimo,
    MAX(f.total) AS montoMaximo,
    CAST(COUNT(f.idFacturacion) * 100.0 / 
         (SELECT COUNT(*) FROM Facturacion) AS DECIMAL(5,2)) AS porcentajeTransacciones
FROM Facturacion f
INNER JOIN Reserva r ON f.idReserva = r.idReserva
INNER JOIN Cliente c ON r.idCliente = c.idCliente
WHERE f.metodoPago != 'Pendiente'
GROUP BY f.metodoPago
ORDER BY montoTotal DESC;

-- CONSULTA 5: Análisis de clientes frecuentes
SELECT 
    c.nombre + ' ' + c.apellido1 + ' ' + ISNULL(c.apellido2, '') AS nombreCompleto,
    c.documentoIdentificacion,
    e.email,
    COUNT(r.idReserva) AS numeroVuelos,
    SUM(r.precioTotal) AS gastoTotal,
    AVG(r.precioTotal) AS gastoPromedio,
    MIN(r.fechaReserva) AS primeraReserva,
    MAX(r.fechaReserva) AS ultimaReserva,
    STRING_AGG(DISTINCT ad.ciudad, ', ') AS destinosVisitados,
    CASE 
        WHEN COUNT(r.idReserva) >= 5 THEN 'VIP'
        WHEN COUNT(r.idReserva) >= 3 THEN 'Frecuente'
        ELSE 'Regular'
    END AS categoriaCliente
FROM Cliente c
INNER JOIN Emails e ON c.idCliente = e.idCliente
INNER JOIN Reserva r ON c.idCliente = r.idCliente
INNER JOIN Vuelo v ON r.idVuelo = v.idVuelo
INNER JOIN Aeropuerto ad ON v.idAeropuertoDestino = ad.idAeropuerto
WHERE r.estadoReserva = 'Confirmada'
GROUP BY c.idCliente, c.nombre, c.apellido1, c.apellido2, c.documentoIdentificacion, e.email
HAVING COUNT(r.idReserva) > 1
ORDER BY gastoTotal DESC;


-- 6. FUNCIONES AUXILIARES


-- Función para calcular duración de vuelo en horas
CREATE OR ALTER FUNCTION fn_DuracionVueloHoras(@idVuelo INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @duracionHoras DECIMAL(5,2);
    
    SELECT @duracionHoras = 
        CAST(DATEDIFF(MINUTE, 
            CAST(CAST(fechaSalida AS VARCHAR) + ' ' + CAST(horaSalida AS VARCHAR) AS DATETIME),
            CAST(CAST(fechaLlegada AS VARCHAR) + ' ' + CAST(horaLlegada AS VARCHAR) AS DATETIME)
        ) AS DECIMAL(10,2)) / 60.0
    FROM Vuelo
    WHERE idVuelo = @idVuelo;
    
    RETURN ISNULL(@duracionHoras, 0);
END;
GO

-- Función para obtener ocupación de vuelo
CREATE OR ALTER FUNCTION fn_PorcentajeOcupacion(@idVuelo INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @capacidadTotal INT, @asientosDisponibles INT, @ocupacion DECIMAL(5,2);
    
    SELECT @asientosDisponibles = asientosDisponibles
    FROM Vuelo 
    WHERE idVuelo = @idVuelo;
    
    SELECT @capacidadTotal = COUNT(*)
    FROM Reserva 
    WHERE idVuelo = @idVuelo AND estadoReserva = 'Confirmada';
    
    SET @capacidadTotal = @capacidadTotal + @asientosDisponibles;
    
    IF @capacidadTotal > 0
        SET @ocupacion = CAST((@capacidadTotal - @asientosDisponibles) * 100.0 / @capacidadTotal AS DECIMAL(5,2));
    ELSE
        SET @ocupacion = 0;
    
    RETURN @ocupacion;
END;
GO


-- 1. TRIGGERS Y FUNCIONES

-- TRIGGER 1: Validar disponibilidad de asientos al hacer reserva
CREATE OR ALTER TRIGGER tr_ValidarAsientosDisponibles
ON Reserva
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @idVuelo INT, @asientosDisponibles INT, @totalReservas INT;
    
    SELECT @idVuelo = idVuelo FROM inserted;
    
    -- Obtener asientos disponibles del vuelo
    SELECT @asientosDisponibles = asientosDisponibles 
    FROM Vuelo 
    WHERE idVuelo = @idVuelo;
    
    -- Contar total de reservas confirmadas para el vuelo
    SELECT @totalReservas = COUNT(*) 
    FROM Reserva 
    WHERE idVuelo = @idVuelo AND estadoReserva = 'Confirmada';
    
    -- Validar que no se exceda la capacidad
    IF @totalReservas > @asientosDisponibles
    BEGIN
        RAISERROR('Error: No hay asientos disponibles en el vuelo. Disponibles: %d, Reservas: %d', 16, 1, @asientosDisponibles, @totalReservas);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- Actualizar asientos disponibles
        UPDATE Vuelo 
        SET asientosDisponibles = @asientosDisponibles - @totalReservas
        WHERE idVuelo = @idVuelo;
        
        PRINT 'Reserva procesada correctamente. Asientos disponibles actualizados.';
    END
END;
GO

-- TRIGGER 2: Generar facturación automática al confirmar reserva
CREATE OR ALTER TRIGGER tr_GenerarFacturacion
ON Reserva
AFTER INSERT
AS
BEGIN
    DECLARE @idReserva INT, @precioTotal DECIMAL(10,2), @numeroFactura VARCHAR(20);
    
    SELECT @idReserva = idReserva, @precioTotal = precioTotal 
    FROM inserted 
    WHERE estadoReserva = 'Confirmada';
    
    IF @idReserva IS NOT NULL
    BEGIN
        -- Generar número de factura único
        SET @numeroFactura = 'FACT-' + CAST(YEAR(GETDATE()) AS VARCHAR(4)) + '-' + 
                           RIGHT('000' + CAST(@idReserva AS VARCHAR), 3);
        
        -- Insertar facturación automática
        INSERT INTO Facturacion (idFacturacion, idReserva, numeroFactura, fechaEmision, total, metodoPago)
        VALUES (@idReserva + 1000, @idReserva, @numeroFactura, GETDATE(), @precioTotal, 'Pendiente');
        
        PRINT 'Factura ' + @numeroFactura + ' generada automáticamente.';
    END
END;
GO

-- TRIGGER 3: Auditar cambios de estado de vuelos
CREATE TABLE AuditoriaVuelos (
    idAuditoria INT IDENTITY(1,1) PRIMARY KEY,
    idVuelo INT NOT NULL,
    estadoAnterior VARCHAR(20),
    estadoNuevo VARCHAR(20),
    fechaCambio DATETIME DEFAULT GETDATE(),
    usuario VARCHAR(100) DEFAULT SYSTEM_USER
);
GO

CREATE OR ALTER TRIGGER tr_AuditarEstadoVuelo
ON Vuelo
AFTER UPDATE
AS
BEGIN
    IF UPDATE(estado)
    BEGIN
        INSERT INTO AuditoriaVuelos (idVuelo, estadoAnterior, estadoNuevo)
        SELECT 
            i.idVuelo,
            d.estado AS estadoAnterior,
            i.estado AS estadoNuevo
        FROM inserted i
        INNER JOIN deleted d ON i.idVuelo = d.idVuelo
        WHERE i.estado != d.estado;
        
        PRINT 'Cambio de estado registrado en auditoría.';
    END
END;
GO

 
-- 2. USUARIOS Y PERMISOS


-- Crear logins y usuarios
CREATE LOGIN administrador_vuelos WITH PASSWORD = 'Admin2024!';
CREATE LOGIN agente_reservas WITH PASSWORD = 'Agente2024!';
CREATE LOGIN cliente_consulta WITH PASSWORD = 'Cliente2024!';

-- Crear usuarios en la base de datos
CREATE USER administrador_vuelos FOR LOGIN administrador_vuelos;
CREATE USER agente_reservas FOR LOGIN agente_reservas;
CREATE USER cliente_consulta FOR LOGIN cliente_consulta;
GO

-- Crear roles personalizados
CREATE ROLE rol_administrador;
CREATE ROLE rol_agente;
CREATE ROLE rol_consulta;
GO

-- Agregar usuarios a roles
ALTER ROLE rol_administrador ADD MEMBER administrador_vuelos;
ALTER ROLE rol_agente ADD MEMBER agente_reservas;
ALTER ROLE rol_consulta ADD MEMBER cliente_consulta;
GO

-- 3. PERMISOS POR ROL


-- PERMISOS PARA ADMINISTRADOR (Acceso total)
GRANT SELECT, INSERT, UPDATE, DELETE ON Aerolinea TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cliente TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Emails TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Telefonos TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Aeropuerto TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Vuelo TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Reserva TO rol_administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON Facturacion TO rol_administrador;
GRANT SELECT ON AuditoriaVuelos TO rol_administrador;

-- PERMISOS PARA AGENTE DE RESERVAS (Operaciones de reservas y consultas)
GRANT SELECT ON Aerolinea TO rol_agente;
GRANT SELECT, INSERT, UPDATE ON Cliente TO rol_agente;
GRANT SELECT, INSERT, UPDATE ON Emails TO rol_agente;
GRANT SELECT, INSERT, UPDATE ON Telefonos TO rol_agente;
GRANT SELECT ON Aeropuerto TO rol_agente;
GRANT SELECT ON Vuelo TO rol_agente;
GRANT SELECT, INSERT, UPDATE ON Reserva TO rol_agente;
GRANT SELECT, INSERT, UPDATE ON Facturacion TO rol_agente;

-- PERMISOS PARA CONSULTA (Solo lectura de información pública)
GRANT SELECT ON Aerolinea TO rol_consulta;
GRANT SELECT ON Aeropuerto TO rol_consulta;
GRANT SELECT ON Vuelo TO rol_consulta;
-- Acceso limitado a reservas (solo sus propias reservas a través de vistas)


-- 4. VISTAS DE SEGURIDAD


-- Vista para consulta pública de vuelos
CREATE OR ALTER VIEW vw_VuelosDisponibles AS
SELECT 
    v.numeroVuelo,
    a.nombreAerolinea,
    ao.nombre + ' (' + ao.codigoAeropuerto + ')' AS aeropuertoOrigen,
    ad.nombre + ' (' + ad.codigoAeropuerto + ')' AS aeropuertoDestino,
    v.fechaSalida,
    v.horaSalida,
    v.fechaLlegada,
    v.horaLlegada,
    v.precioBase,
    v.asientosDisponibles,
    v.estado
FROM Vuelo v
INNER JOIN Aerolinea a ON v.idAerolinea = a.idAerolinea
INNER JOIN Aeropuerto ao ON v.idAeropuertoOrigen = ao.idAeropuerto
INNER JOIN Aeropuerto ad ON v.idAeropuertoDestino = ad.idAeropuerto
WHERE v.estado = 'Activo' AND v.asientosDisponibles > 0;
GO

-- Otorgar permisos en la vista
GRANT SELECT ON vw_VuelosDisponibles TO rol_consulta;


-- 5. CONSULTAS CON JOINS


-- CONSULTA 1: Información completa de reservas con detalles del vuelo
SELECT 
    r.codigoConfirmacion,
    c.nombre + ' ' + c.apellido1 + ' ' + ISNULL(c.apellido2, '') AS nombreCompleto,
    c.documentoIdentificacion,
    e.email,
    t.telefono,
    a.nombreAerolinea,
    v.numeroVuelo,
    ao.nombre + ' (' + ao.ciudad + ', ' + ao.pais + ')' AS origen,
    ad.nombre + ' (' + ad.ciudad + ', ' + ad.pais + ')' AS destino,
    v.fechaSalida,
    v.horaSalida,
    v.fechaLlegada,
    v.horaLlegada,
    r.numeroAsiento,
    r.precioTotal,
    r.estadoReserva,
    f.numeroFactura,
    f.metodoPago,
    f.fechaEmision
FROM Reserva r
INNER JOIN Cliente c ON r.idCliente = c.idCliente
INNER JOIN Emails e ON c.idCliente = e.idCliente
INNER JOIN Telefonos t ON c.idCliente = t.idCliente
INNER JOIN Vuelo v ON r.idVuelo = v.idVuelo
INNER JOIN Aerolinea a ON v.idAerolinea = a.idAerolinea
INNER JOIN Aeropuerto ao ON v.idAeropuertoOrigen = ao.idAeropuerto
INNER JOIN Aeropuerto ad ON v.idAeropuertoDestino = ad.idAeropuerto
LEFT JOIN Facturacion f ON r.idReserva = f.idReserva
ORDER BY r.fechaReserva DESC;

-- CONSULTA 2: Análisis de ocupación por aerolínea y ruta
SELECT 
    a.nombreAerolinea,
    ao.ciudad + ' → ' + ad.ciudad AS ruta,
    COUNT(v.idVuelo) AS totalVuelos,
    SUM(CASE WHEN v.estado = 'Activo' THEN 1 ELSE 0 END) AS vuelosActivos,
    AVG(CAST(v.asientosDisponibles AS FLOAT)) AS promedioAsientosDisponibles,
    COUNT(r.idReserva) AS totalReservas,
    SUM(r.precioTotal) AS ingresosTotales,
    AVG(r.precioTotal) AS precioPromedio
FROM Aerolinea a
INNER JOIN Vuelo v ON a.idAerolinea = v.idAerolinea
INNER JOIN Aeropuerto ao ON v.idAeropuertoOrigen = ao.idAeropuerto
INNER JOIN Aeropuerto ad ON v.idAeropuertoDestino = ad.idAeropuerto
LEFT JOIN Reserva r ON v.idVuelo = r.idVuelo AND r.estadoReserva = 'Confirmada'
GROUP BY a.nombreAerolinea, ao.ciudad, ad.ciudad
ORDER BY ingresosTotales DESC;

-- CONSULTA 3: Ranking de destinos más populares desde Costa Rica
SELECT 
    ad.ciudad AS destino,
    ad.pais,
    COUNT(r.idReserva) AS numeroReservas,
    AVG(r.precioTotal) AS precioPromedio,
    MIN(r.precioTotal) AS precioMinimo,
    MAX(r.precioTotal) AS precioMaximo,
    STRING_AGG(DISTINCT a.nombreAerolinea, ', ') AS aerolineas,
    RANK() OVER (ORDER BY COUNT(r.idReserva) DESC) AS ranking
FROM Vuelo v
INNER JOIN Aeropuerto ao ON v.idAeropuertoOrigen = ao.idAeropuerto
INNER JOIN Aeropuerto ad ON v.idAeropuertoDestino = ad.idAeropuerto
INNER JOIN Aerolinea a ON v.idAerolinea = a.idAerolinea
INNER JOIN Reserva r ON v.idVuelo = r.idVuelo
WHERE ao.pais = 'Costa Rica' AND r.estadoReserva = 'Confirmada'
GROUP BY ad.ciudad, ad.pais
HAVING COUNT(r.idReserva) > 0
ORDER BY numeroReservas DESC;

-- CONSULTA 4: Resumen financiero por método de pago
SELECT 
    f.metodoPago,
    COUNT(f.idFacturacion) AS numeroTransacciones,
    SUM(f.total) AS montoTotal,
    AVG(f.total) AS montoPromedio,
    MIN(f.total) AS montoMinimo,
    MAX(f.total) AS montoMaximo,
    CAST(COUNT(f.idFacturacion) * 100.0 / 
         (SELECT COUNT(*) FROM Facturacion) AS DECIMAL(5,2)) AS porcentajeTransacciones
FROM Facturacion f
INNER JOIN Reserva r ON f.idReserva = r.idReserva
INNER JOIN Cliente c ON r.idCliente = c.idCliente
WHERE f.metodoPago != 'Pendiente'
GROUP BY f.metodoPago
ORDER BY montoTotal DESC;

-- CONSULTA 5: Análisis de clientes frecuentes
SELECT 
    c.nombre + ' ' + c.apellido1 + ' ' + ISNULL(c.apellido2, '') AS nombreCompleto,
    c.documentoIdentificacion,
    e.email,
    COUNT(r.idReserva) AS numeroVuelos,
    SUM(r.precioTotal) AS gastoTotal,
    AVG(r.precioTotal) AS gastoPromedio,
    MIN(r.fechaReserva) AS primeraReserva,
    MAX(r.fechaReserva) AS ultimaReserva,
    STRING_AGG(DISTINCT ad.ciudad, ', ') AS destinosVisitados,
    CASE 
        WHEN COUNT(r.idReserva) >= 5 THEN 'VIP'
        WHEN COUNT(r.idReserva) >= 3 THEN 'Frecuente'
        ELSE 'Regular'
    END AS categoriaCliente
FROM Cliente c
INNER JOIN Emails e ON c.idCliente = e.idCliente
INNER JOIN Reserva r ON c.idCliente = r.idCliente
INNER JOIN Vuelo v ON r.idVuelo = v.idVuelo
INNER JOIN Aeropuerto ad ON v.idAeropuertoDestino = ad.idAeropuerto
WHERE r.estadoReserva = 'Confirmada'
GROUP BY c.idCliente, c.nombre, c.apellido1, c.apellido2, c.documentoIdentificacion, e.email
HAVING COUNT(r.idReserva) > 1
ORDER BY gastoTotal DESC;


-- 6. FUNCIONES AUXILIARES


-- Función para calcular duración de vuelo en horas
CREATE OR ALTER FUNCTION fn_DuracionVueloHoras(@idVuelo INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @duracionHoras DECIMAL(5,2);
    
    SELECT @duracionHoras = 
        CAST(DATEDIFF(MINUTE, 
            CAST(CAST(fechaSalida AS VARCHAR) + ' ' + CAST(horaSalida AS VARCHAR) AS DATETIME),
            CAST(CAST(fechaLlegada AS VARCHAR) + ' ' + CAST(horaLlegada AS VARCHAR) AS DATETIME)
        ) AS DECIMAL(10,2)) / 60.0
    FROM Vuelo
    WHERE idVuelo = @idVuelo;
    
    RETURN ISNULL(@duracionHoras, 0);
END;
GO

-- Función para obtener ocupación de vuelo
CREATE OR ALTER FUNCTION fn_PorcentajeOcupacion(@idVuelo INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @capacidadTotal INT, @asientosDisponibles INT, @ocupacion DECIMAL(5,2);
    
    SELECT @asientosDisponibles = asientosDisponibles
    FROM Vuelo 
    WHERE idVuelo = @idVuelo;
    
    SELECT @capacidadTotal = COUNT(*)
    FROM Reserva 
    WHERE idVuelo = @idVuelo AND estadoReserva = 'Confirmada';
    
    SET @capacidadTotal = @capacidadTotal + @asientosDisponibles;
    
    IF @capacidadTotal > 0
        SET @ocupacion = CAST((@capacidadTotal - @asientosDisponibles) * 100.0 / @capacidadTotal AS DECIMAL(5,2));
    ELSE
        SET @ocupacion = 0;
    
    RETURN @ocupacion;
END;
GO


-- 7. CONSULTAS DE VERIFICACIÓN


-- Verificar usuarios creados
SELECT 
    dp.name AS usuario,
    dp.type_desc AS tipo,
    r.name AS rol
FROM sys.database_principals dp
LEFT JOIN sys.database_role_members rm ON dp.principal_id = rm.member_principal_id
LEFT JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
WHERE dp.type IN ('S', 'U') AND dp.name NOT IN ('dbo', 'guest', 'INFORMATION_SCHEMA', 'sys')
ORDER BY dp.name;

-- Verificar permisos por rol
SELECT 
    dp.name AS rol,
    dp2.name AS objeto,
    p.permission_name,
    p.state_desc
FROM sys.database_permissions p
INNER JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
INNER JOIN sys.objects o ON p.major_id = o.object_id
INNER JOIN sys.database_principals dp2 ON o.schema_id = dp2.principal_id
WHERE dp.name IN ('rol_administrador', 'rol_agente', 'rol_consulta')
ORDER BY dp.name, dp2.name;

-- Probar funciones
SELECT 
    v.numeroVuelo,
    dbo.fn_DuracionVueloHoras(v.idVuelo) AS duracionHoras,
    dbo.fn_PorcentajeOcupacion(v.idVuelo) AS porcentajeOcupacion
FROM Vuelo v
WHERE v.idVuelo <= 5;

PRINT 'Sistema de gestión de vuelos configurado exitosamente.';
PRINT 'Usuarios creados: administrador_vuelos, agente_reservas, cliente_consulta';
PRINT 'Triggers activos: Validación de asientos, Facturación automática, Auditoría';
PRINT 'Consultas y funciones disponibles para análisis completo.';