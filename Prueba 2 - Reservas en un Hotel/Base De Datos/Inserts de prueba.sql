USE Tecniscan_Hotel;

-- Insertar 20 registros en la tabla Clientes
INSERT INTO Clientes (Nombre, Email) VALUES
('Carlos Pérez', 'carlos.perez@gmail.com'),
('María Gómez', 'maria.gomez@hotmail.com'),
('Juan López', 'juan.lopez@yahoo.com'),
('Ana Martínez', 'ana.martinez@outlook.com'),
('Luis Hernández', 'luis.hernandez@gmail.com'),
('Sofía García', 'sofia.garcia@gmail.com'),
('Pedro Jiménez', 'pedro.jimenez@outlook.com'),
('Marta Sánchez', 'marta.sanchez@yahoo.com'),
('Daniel Torres', 'daniel.torres@gmail.com'),
('Laura Rivera', 'laura.rivera@hotmail.com'),
('Ricardo Castillo', 'ricardo.castillo@gmail.com'),
('Isabel Reyes', 'isabel.reyes@yahoo.com'),
('Jorge Cruz', 'jorge.cruz@hotmail.com'),
('Gabriela Ramírez', 'gabriela.ramirez@gmail.com'),
('Eduardo Morales', 'eduardo.morales@outlook.com'),
('Carmen Vásquez', 'carmen.vasquez@gmail.com'),
('Sergio Rojas', 'sergio.rojas@gmail.com'),
('Patricia León', 'patricia.leon@hotmail.com'),
('Enrique Ortiz', 'enrique.ortiz@yahoo.com'),
('Lucía Castro', 'lucia.castro@gmail.com');


-- Insertar 20 registros en la tabla Habitaciones
INSERT INTO Habitaciones (TipoHabitacion, PrecioPorNoche) VALUES
('Individual', 50.00),
('Doble', 80.00),
('Suite', 150.00),
('Familiar', 120.00),
('Individual', 55.00),
('Doble', 85.00),
('Suite', 160.00),
('Familiar', 130.00),
('Individual', 52.00),
('Doble', 90.00),
('Suite', 170.00),
('Familiar', 140.00),
('Individual', 60.00),
('Doble', 75.00),
('Suite', 155.00),
('Familiar', 125.00),
('Individual', 65.00),
('Doble', 95.00),
('Suite', 180.00),
('Familiar', 150.00);


-- Insertar 20 registros en la tabla Reservas
INSERT INTO Reservas (ClienteID, HabitacionID, FechaEntrada, FechaSalida, Total) VALUES
(1, 3, '2024-10-01', '2024-10-05', 600.00),   -- Carlos Pérez, Suite
(2, 1, '2024-09-20', '2024-09-22', 110.00),   -- María Gómez, Individual
(3, 2, '2024-09-25', '2024-09-30', 400.00),   -- Juan López, Doble
(4, 4, '2024-10-10', '2024-10-15', 600.00),   -- Ana Martínez, Familiar
(5, 1, '2024-09-28', '2024-09-29', 50.00),    -- Luis Hernández, Individual
(6, 3, '2024-10-02', '2024-10-07', 750.00),   -- Sofía García, Suite
(7, 2, '2024-09-25', '2024-09-28', 255.00),   -- Pedro Jiménez, Doble
(8, 1, '2024-10-05', '2024-10-08', 180.00),   -- Marta Sánchez, Individual
(9, 4, '2024-09-15', '2024-09-18', 480.00),   -- Daniel Torres, Familiar
(10, 3, '2024-09-20', '2024-09-24', 600.00),  -- Laura Rivera, Suite
(11, 2, '2024-09-29', '2024-10-02', 255.00),  -- Ricardo Castillo, Doble
(12, 4, '2024-10-01', '2024-10-04', 520.00),  -- Isabel Reyes, Familiar
(13, 1, '2024-10-03', '2024-10-04', 55.00),   -- Jorge Cruz, Individual
(14, 3, '2024-09-28', '2024-09-30', 320.00),  -- Gabriela Ramírez, Suite
(15, 2, '2024-09-23', '2024-09-26', 255.00),  -- Eduardo Morales, Doble
(16, 4, '2024-09-30', '2024-10-03', 390.00),  -- Carmen Vásquez, Familiar
(17, 1, '2024-09-28', '2024-09-29', 60.00),   -- Sergio Rojas, Individual
(18, 3, '2024-09-21', '2024-09-23', 320.00),  -- Patricia León, Suite
(19, 2, '2024-09-25', '2024-09-28', 270.00),  -- Enrique Ortiz, Doble
(20, 4, '2024-10-01', '2024-10-05', 600.00);  -- Lucía Castro, Familiar


select * from Reservas;

select * from Habitaciones;

INSERT INTO Reservas (ClienteID, HabitacionID, FechaEntrada, FechaSalida, Total) VALUES
(1, 3, '2024-10-07', '2024-10-11', 600.00)



EXEC RegistrarReserva @ClienteID = 1, @HabitacionID = 3, @FechaEntrada = '2024-10-10', @FechaSalida = '2024-10-15';
EXEC RegistrarReserva @ClienteID = 2, @HabitacionID = 1, @FechaEntrada = '2024-11-01', @FechaSalida = '2024-11-03';
EXEC RegistrarReserva @ClienteID = 3, @HabitacionID = 2, @FechaEntrada = '2024-10-20', @FechaSalida = '2024-10-25';
EXEC RegistrarReserva @ClienteID = 4, @HabitacionID = 4, @FechaEntrada = '2024-12-01', @FechaSalida = '2024-12-05';
EXEC RegistrarReserva @ClienteID = 6, @HabitacionID = 3, @FechaEntrada = '2024-11-15', @FechaSalida = '2024-11-18';
