-- ################################# SCRIPT PARA LAS CONSULTAS ##################################

USE Tecniscan_Hotel;


--  Consulta para obtener el total de ingresos generados por cliente

SELECT 
    c.ClienteID AS 'Id del Cliente',
    c.Nombre AS 'Nombre',
    SUM(r.Total) AS 'Total Ingresos'
FROM 
    Clientes c
LEFT JOIN 
    Reservas r ON c.ClienteID = r.ClienteID
GROUP BY 
    c.ClienteID, c.Nombre;





--  Consulta para obtener las reservas activas

SELECT 
    r.ReservaID AS 'Id de la Reserva',
    r.ClienteID AS 'Id del Cliente',
    r.HabitacionID AS 'Id de la Habitacion',
    r.FechaEntrada AS 'Fecha de Entrada',
    r.FechaSalida AS 'Fecha de Salida',
    r.Total AS 'Total'
FROM 
    Reservas r
WHERE 
    r.FechaSalida > GETDATE();
