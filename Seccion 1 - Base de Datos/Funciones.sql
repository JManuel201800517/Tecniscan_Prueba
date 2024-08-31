-- SCRIPT PARA LA REALIZACION DE LAS FUNCIONES


-- Crear la funci�n para contar el n�mero de �rdenes en una fecha dada
CREATE FUNCTION ContarOrdenesPorFecha (@Fecha DATE)
RETURNS INT
AS
BEGIN
    DECLARE @TotalOrdenes INT;
    SELECT @TotalOrdenes = COUNT(*) FROM Ordenes WHERE FechaOrden = @Fecha;
    RETURN @TotalOrdenes;
END;
