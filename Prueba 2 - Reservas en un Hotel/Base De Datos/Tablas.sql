-- ################################# SCRIPT PARA LAS TABLAS ##################################

CREATE DATABASE Tecniscan_Hotel;

USE Tecniscan_Hotel;

-- Primero se crae la tabla de clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- Segundo es la tabla para las habitaciones
CREATE TABLE Habitaciones (
    HabitacionID INT PRIMARY KEY IDENTITY(1,1),
    TipoHabitacion VARCHAR(50) NOT NULL,
    PrecioPorNoche DECIMAL(10, 2) NOT NULL
);

-- La tercera tabla es la tabla para las reservas
CREATE TABLE Reservas (
    ReservaID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT NOT NULL,
    HabitacionID INT NOT NULL,
    FechaEntrada DATETIME NOT NULL,
    FechaSalida DATETIME NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_CLIENTE FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    CONSTRAINT FK_HABITACION FOREIGN KEY (HabitacionID) REFERENCES Habitaciones(HabitacionID)
);
