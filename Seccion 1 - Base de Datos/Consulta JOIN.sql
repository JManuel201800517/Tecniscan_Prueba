-- Siempre es bueno que en los diferentes scripts que se utilicen, asegurar en que base de datos se esta implementando
USE Tecniscan_Prueba;


-- SCRIPT PARA LA REALIZACION DE LAS CONSULTAS


-- Consulta para obtener todos los clientes y las órdenes asociadas a cada cliente
SELECT 
    c.Nombre AS 'NOMBRE',
    o.FechaOrden AS 'FECHA',
    o.Total AS 'TOTAL'
FROM 
    Clientes c
LEFT JOIN 
    Ordenes o ON c.ClienteID = o.ClienteID;