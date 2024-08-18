-- Creata table



CREATE SCHEMA `spacex` ;

use spacex;

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección VARCHAR(255),
    País VARCHAR(50),
    Email VARCHAR(100),
    Teléfono VARCHAR(20)
); select * from spacex.clientes;

CREATE TABLE Empleados (
    ID_Empleado INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Cargo VARCHAR(50),
    Departamento VARCHAR(50),
    Fecha_Contratación DATE
);select * from spacex.empleados;

CREATE TABLE Cohetes (
    ID_Cohete INT PRIMARY KEY,
    Modelo VARCHAR(100),
    Altura FLOAT,
    Diámetro FLOAT,
    Masa FLOAT,
    Empuje FLOAT,
    Fabricante_ID INT,
    FOREIGN KEY (Fabricante_ID) REFERENCES Empleados(ID_Empleado)
); select * from spacex.cohetes;

CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    Email VARCHAR(100)
);select * from spacex.proveedores;

CREATE TABLE Componentes_Cohetes (
    ID_Componente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Tipo VARCHAR(50),
    Peso FLOAT,
    ID_Cohete INT,
    Proveedor_ID INT,
    FOREIGN KEY (ID_Cohete) REFERENCES Cohetes(ID_Cohete),
    FOREIGN KEY (Proveedor_ID) REFERENCES Proveedores(ID_Proveedor)
); select * from spacex.componentes_cohetes;

CREATE TABLE Lanzamientos (
    ID_Lanzamiento INT PRIMARY KEY,
    Fecha DATE,
    Tipo_Cohete VARCHAR(100),
    Descripción_Misión TEXT,
    Cliente_ID INT,
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(ID_Cliente)
); select * from spacex.lanzamientos;

CREATE TABLE Contratos (
    ID_Contrato INT PRIMARY KEY,
    Cliente_ID INT,
    Fecha_Firma DATE,
    Monto DECIMAL(15,2),
    ID_Lanzamiento INT,
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Lanzamiento) REFERENCES Lanzamientos(ID_Lanzamiento)
);select * from spacex.contratos;

-- Inserción en la tabla Clientes
INSERT INTO Clientes (ID_Cliente, Nombre, Dirección, País, Email, Teléfono)
VALUES (1, 'NASA', 'Washington, DC', 'USA', 'nasa@example.com', '+1-202-555-0114');

INSERT INTO Clientes (ID_Cliente, Nombre, Dirección, País, Email, Teléfono)
VALUES (2, 'Telecom Colombia', 'Bogotá, Colombia', 'Colombia', 'contacto@telecomcolombia.co', '+57-1-555-1234');

-- Inserción en la tabla Empleados
INSERT INTO Empleados (ID_Empleado, Nombre, Apellido, Cargo, Departamento, Fecha_Contratación)
VALUES (1, 'Elon', 'Musk', 'CEO', 'Management', '2002-03-14');

INSERT INTO Empleados (ID_Empleado, Nombre, Apellido, Cargo, Departamento, Fecha_Contratación)
VALUES (2, 'Gwynne', 'Shotwell', 'COO', 'Management', '2002-07-11');

-- Inserción en la tabla Cohetes
INSERT INTO Cohetes (ID_Cohete, Modelo, Altura, Diámetro, Masa, Empuje, Fabricante_ID)
VALUES (1, 'Falcon 9', 70, 3.7, 549054, 7607, 1);

INSERT INTO Cohetes (ID_Cohete, Modelo, Altura, Diámetro, Masa, Empuje, Fabricante_ID)
VALUES (2, 'Falcon Heavy', 70, 3.7, 1420788, 22800, 2);

-- Inserción en la tabla Proveedores
INSERT INTO Proveedores (ID_Proveedor, Nombre, Dirección, Teléfono, Email)
VALUES (1, 'SpaceX Supplier 1', 'Hawthorne, CA', '+1-310-555-1234', 'supplier1@spacex.com');

INSERT INTO Proveedores (ID_Proveedor, Nombre, Dirección, Teléfono, Email)
VALUES (2, 'SpaceX Supplier 2', 'Houston, TX', '+1-713-555-5678', 'supplier2@spacex.com');

-- Inserción en la tabla Componentes_Cohetes
INSERT INTO Componentes_Cohetes (ID_Componente, Nombre, Tipo, Peso, ID_Cohete, Proveedor_ID)
VALUES (1, 'Merlin Engine', 'Motor', 470, 1, 1);

INSERT INTO Componentes_Cohetes (ID_Componente, Nombre, Tipo, Peso, ID_Cohete, Proveedor_ID)
VALUES (2, 'Grid Fins', 'Control', 150, 1, 2);

-- Inserción en la tabla Lanzamientos
INSERT INTO Lanzamientos (ID_Lanzamiento, Fecha, Tipo_Cohete, Descripción_Misión, Cliente_ID)
VALUES (1, '2024-09-01', 'Falcon 9', 'Lanzamiento de satélites de comunicación para NASA', 1);

INSERT INTO Lanzamientos (ID_Lanzamiento, Fecha, Tipo_Cohete, Descripción_Misión, Cliente_ID)
VALUES (2, '2024-10-15', 'Falcon Heavy', 'Lanzamiento de satélites de observación para Telecom Colombia', 2);

-- Inserción en la tabla Contratos
INSERT INTO Contratos (ID_Contrato, Cliente_ID, Fecha_Firma, Monto, ID_Lanzamiento)
VALUES (1, 1, '2023-12-01', 65000000.00, 1);

INSERT INTO Contratos (ID_Contrato, Cliente_ID, Fecha_Firma, Monto, ID_Lanzamiento)
VALUES (2, 2, '2024-01-15', 85000000.00, 2);


-- Seleccionamos todas las tablas para mirar los datos insertados
SELECT * FROM Clientes;
SELECT * FROM Empleados;
SELECT * FROM Cohetes;
SELECT * FROM Proveedores;
SELECT * FROM Componentes_Cohetes;
SELECT * FROM Lanzamientos;
SELECT * FROM Contratos;


-- Eliminación de un cliente
DELETE FROM Clientes WHERE ID_Cliente = 2;

-- Eliminación de un empleado
DELETE FROM Empleados WHERE ID_Empleado = 2;

-- Eliminación de un cohete
DELETE FROM Cohetes WHERE ID_Cohete = 2;

-- Eliminación de un proveedor
DELETE FROM Proveedores WHERE ID_Proveedor = 2;

-- Eliminación de un componente de cohete
DELETE FROM Componentes_Cohetes WHERE ID_Componente = 2;

-- Eliminación de un lanzamiento
DELETE FROM Lanzamientos WHERE ID_Lanzamiento = 2;

-- Eliminación de un contrato
DELETE FROM Contratos WHERE ID_Contrato = 2;



-- Actualización de la dirección de un cliente
UPDATE Clientes
SET Dirección = 'Calle 123, Bogotá, Colombia'
WHERE ID_Cliente = 2;

-- Actualización del cargo de un empleado
UPDATE Empleados
SET Cargo = 'Senior Engineer'
WHERE ID_Empleado = 2;

-- Actualización del empuje de un cohete
UPDATE Cohetes
SET Empuje = 8000
WHERE ID_Cohete = 1;

-- Actualización del teléfono de un proveedor
UPDATE Proveedores
SET Teléfono = '+1-310-555-4321'
WHERE ID_Proveedor = 1;

-- Actualización del peso de un componente
UPDATE Componentes_Cohetes
SET Peso = 500
WHERE ID_Componente = 1;

-- Actualización de la descripción de una misión de lanzamiento
UPDATE Lanzamientos
SET Descripción_Misión = 'Actualización: Lanzamiento de satélites de comunicación para NASA y observación terrestre'
WHERE ID_Lanzamiento = 1;

-- Actualización del monto de un contrato
UPDATE Contratos
SET Monto = 68000000.00
WHERE ID_Contrato = 1;

-- Eliminar los contratos relacionados con el cliente
DELETE FROM Contratos WHERE Cliente_ID = 2;

-- Eliminar los Lanzamientos con relacion con el cliente
DELETE FROM Lanzamientos where Cliente_ID=2;

-- Ahora eliminar el cliente
DELETE FROM Clientes WHERE ID_Cliente = 2;


SELECT * FROM Clientes;



