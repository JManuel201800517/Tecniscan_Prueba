-- ################################# SCRIPT PARA LOS PROCEDIMIENTOS ALMACENADOS ##################################

USE Tecniscan_Hotel;

-- Procedimiento almacenado para registrar una nueva reserva

CREATE PROCEDURE RegistrarReserva
    @ClienteID INT,
    @HabitacionID INT,
    @FechaEntrada DATETIME,
    @FechaSalida DATETIME
AS
BEGIN
    DECLARE @PrecioPorNoche DECIMAL(10, 2);
    DECLARE @NumeroNoches INT;
    DECLARE @Total DECIMAL(10, 2);
    
    -- Obtener el precio por noche de la habitación
    SELECT @PrecioPorNoche = PrecioPorNoche 
    FROM Habitaciones 
    WHERE HabitacionID = @HabitacionID;

    -- Calcular el número de noches
    SET @NumeroNoches = DATEDIFF(DAY, @FechaEntrada, @FechaSalida);
    
    -- Calcular el total
    SET @Total = @PrecioPorNoche * @NumeroNoches;

    -- Insertar la nueva reserva
    INSERT INTO Reservas (ClienteID, HabitacionID, FechaEntrada, FechaSalida, Total)
    VALUES (@ClienteID, @HabitacionID, @FechaEntrada, @FechaSalida, @Total);
END;
