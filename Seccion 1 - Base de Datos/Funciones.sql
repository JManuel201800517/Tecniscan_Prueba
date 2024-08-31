-- SCRIPT PARA LA REALIZACION DE LAS FUNCIONES


-- Crear la función para contar el número de órdenes en una fecha dada
CREATE FUNCTION ContarOrdenesPorFecha (@Fecha DATE)
RETURNS INT
AS
BEGIN
    DECLARE @TotalOrdenes INT;
    SELECT @TotalOrdenes = COUNT(*) FROM Ordenes WHERE FechaOrden = @Fecha;
    RETURN @TotalOrdenes;
END;
