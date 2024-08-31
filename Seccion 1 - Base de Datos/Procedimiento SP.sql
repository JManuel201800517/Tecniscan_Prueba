-- SCRIPT PARA LA REALIZACION DE LOS PROCEDIMIENTOS


-- Crear procedimiento almacenado para obtener �rdenes por ClienteID
CREATE PROCEDURE ObtenerOrdenesPorCliente
    @ClienteID INT
AS
BEGIN
    SELECT 
        OrdenID,
        FechaOrden,
        Total
    FROM 
        Ordenes
    WHERE 
        ClienteID = @ClienteID;
END;