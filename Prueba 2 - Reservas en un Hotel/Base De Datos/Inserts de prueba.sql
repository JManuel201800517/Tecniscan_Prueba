USE Tecniscan_Hotel;

-- Insertar 20 registros en la tabla Clientes
INSERT INTO Clientes (Nombre, Email) VALUES
('Carlos P�rez', 'carlos.perez@gmail.com'),
('Mar�a G�mez', 'maria.gomez@hotmail.com'),
('Juan L�pez', 'juan.lopez@yahoo.com'),
('Ana Mart�nez', 'ana.martinez@outlook.com'),
('Luis Hern�ndez', 'luis.hernandez@gmail.com'),
('Sof�a Garc�a', 'sofia.garcia@gmail.com'),
('Pedro Jim�nez', 'pedro.jimenez@outlook.com'),
('Marta S�nchez', 'marta.sanchez@yahoo.com'),
('Daniel Torres', 'daniel.torres@gmail.com'),
('Laura Rivera', 'laura.rivera@hotmail.com'),
('Ricardo Castillo', 'ricardo.castillo@gmail.com'),
('Isabel Reyes', 'isabel.reyes@yahoo.com'),
('Jorge Cruz', 'jorge.cruz@hotmail.com'),
('Gabriela Ram�rez', 'gabriela.ramirez@gmail.com'),
('Eduardo Morales', 'eduardo.morales@outlook.com'),
('Carmen V�squez', 'carmen.vasquez@gmail.com'),
('Sergio Rojas', 'sergio.rojas@gmail.com'),
('Patricia Le�n', 'patricia.leon@hotmail.com'),
('Enrique Ortiz', 'enrique.ortiz@yahoo.com'),
('Luc�a Castro', 'lucia.castro@gmail.com');


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
(1, 3, '2024-10-01', '2024-10-05', 600.00),   -- Carlos P�rez, Suite
(2, 1, '2024-09-20', '2024-09-22', 110.00),   -- Mar�a G�mez, Individual
(3, 2, '2024-09-25', '2024-09-30', 400.00),   -- Juan L�pez, Doble
(4, 4, '2024-10-10', '2024-10-15', 600.00),   -- Ana Mart�nez, Familiar
(5, 1, '2024-09-28', '2024-09-29', 50.00),    -- Luis Hern�ndez, Individual
(6, 3, '2024-10-02', '2024-10-07', 750.00),   -- Sof�a Garc�a, Suite
(7, 2, '2024-09-25', '2024-09-28', 255.00),   -- Pedro Jim�nez, Doble
(8, 1, '2024-10-05', '2024-10-08', 180.00),   -- Marta S�nchez, Individual
(9, 4, '2024-09-15', '2024-09-18', 480.00),   -- Daniel Torres, Familiar
(10, 3, '2024-09-20', '2024-09-24', 600.00),  -- Laura Rivera, Suite
(11, 2, '2024-09-29', '2024-10-02', 255.00),  -- Ricardo Castillo, Doble
(12, 4, '2024-10-01', '2024-10-04', 520.00),  -- Isabel Reyes, Familiar
(13, 1, '2024-10-03', '2024-10-04', 55.00),   -- Jorge Cruz, Individual
(14, 3, '2024-09-28', '2024-09-30', 320.00),  -- Gabriela Ram�rez, Suite
(15, 2, '2024-09-23', '2024-09-26', 255.00),  -- Eduardo Morales, Doble
(16, 4, '2024-09-30', '2024-10-03', 390.00),  -- Carmen V�squez, Familiar
(17, 1, '2024-09-28', '2024-09-29', 60.00),   -- Sergio Rojas, Individual
(18, 3, '2024-09-21', '2024-09-23', 320.00),  -- Patricia Le�n, Suite
(19, 2, '2024-09-25', '2024-09-28', 270.00),  -- Enrique Ortiz, Doble
(20, 4, '2024-10-01', '2024-10-05', 600.00);  -- Luc�a Castro, Familiar


select * from Reservas;

select * from Habitaciones;

INSERT INTO Reservas (ClienteID, HabitacionID, FechaEntrada, FechaSalida, Total) VALUES
(1, 3, '2024-10-07', '2024-10-11', 600.00)



EXEC RegistrarReserva @ClienteID = 1, @HabitacionID = 3, @FechaEntrada = '2024-10-10', @FechaSalida = '2024-10-15';
EXEC RegistrarReserva @ClienteID = 2, @HabitacionID = 1, @FechaEntrada = '2024-11-01', @FechaSalida = '2024-11-03';
EXEC RegistrarReserva @ClienteID = 3, @HabitacionID = 2, @FechaEntrada = '2024-10-20', @FechaSalida = '2024-10-25';
EXEC RegistrarReserva @ClienteID = 4, @HabitacionID = 4, @FechaEntrada = '2024-12-01', @FechaSalida = '2024-12-05';
EXEC RegistrarReserva @ClienteID = 6, @HabitacionID = 3, @FechaEntrada = '2024-11-15', @FechaSalida = '2024-11-18';
