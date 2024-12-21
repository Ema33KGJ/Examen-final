
CREATE DATABASE Proyectos

CREATE TABLE Empleados (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NumeroCarnet VARCHAR(50) UNIQUE NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
	Categoria VARCHAR(50) NOT NULL CHECK (Categoria IN ('Administrador', 'Operario', 'Peón')),
    Salario DECIMAL(10, 2) DEFAULT 250000 CHECK (Salario BETWEEN 250000 AND 500000),
    Direccion VARCHAR(255) DEFAULT 'San José',
    Telefono VARCHAR(15) NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Proyectos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(50) UNIQUE NOT NULL,
    Nombre VARCHAR(100) UNIQUE NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL
);

CREATE TABLE Asignaciones (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    EmpleadoId INT NOT NULL,
    ProyectoId INT NOT NULL,
    FechaAsignacion DATE NOT NULL,
    FOREIGN KEY (EmpleadoId) REFERENCES Empleados(Id),
    FOREIGN KEY (ProyectoId) REFERENCES Proyectos(Id)
);

