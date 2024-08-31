-- SCRIPT PARA LA REALIZACION DE LOS TRIGGERS


-- Crear trigger para verificar que el total de la orden sea mayor que 0 antes de insertar
CREATE or ALTER TRIGGER trg_VerificarTotalOrden
ON Ordenes
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Total <= 0)
    BEGIN
        RAISERROR('El total de la orden debe ser mayor que 0.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Ordenes (ClienteID, FechaOrden, Total)
        SELECT ClienteID, FechaOrden, Total FROM inserted;
    END
END;

