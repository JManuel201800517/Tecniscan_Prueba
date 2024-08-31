-- El primer paso siempre es crear la base de datos
CREATE DATABASE Tecniscan_Prueba;

-- Luego nos aseguramos de seleccionar la base de Datos
USE Tecniscan_Prueba;


-- Y COMENZAMOS A UTILIZAR LA BASE DE DATOS

-- Primero se crea la tabla Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- Segundo se crea la tabla para las Ordenes
CREATE TABLE Ordenes (
    OrdenID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT,
    FechaOrden DATE NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Cliente FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Ya se incluyó en la creación de las tablas:
-- PRIMARY KEY en ClienteID de Clientes y OrdenID de Ordenes
-- FOREIGN KEY en ClienteID de Ordenes referenciando a ClienteID de Clientes
