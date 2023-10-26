USE MASTER

CREATE DATABASE Catalogo

USE Catalogo

DROP TABLE Clientes

CREATE TABLE Clientes
(
  Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Nombre VARCHAR(60) NOT NULL,
  Telefono CHAR(15) NOT NULL,
)

INSERT INTO Clientes
(
  Nombre, Telefono
)
VALUES (
    "Juan Felipe Quintero Gutierrez", "300 123 4567"
)

DROP TABLE Pedidos

CREATE TABLE Pedidos
(
  Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  IdCliente INT NOT NULL,
  Fecha VARCHAR(8) NOT NULL,
  FOREIGN KEY (IdCliente) REFERENCES Clientes(Id)
)

INSERT INTO Pedidos
(
  IdCliente, Fecha
)
VALUES (
    1, "2020-01-01"
)

DROP TABLE Pagos

CREATE TABLE Pagos(
  Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  IdPedido INT NOT NULL,
  Valor DECIMAL(6,3) NOT NULL,
  Abono DECIMAL(6,3) NOT NULL,
  FOREIGN KEY (IdPedido) REFERENCES Pedidos(Id)
)

INSERT INTO Pagos
(
  IdPedido, Valor, Abono
)
VALUES (
    1, 100000, 10000
)

DROP TABLE Productos

CREATE TABLE Productos(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Nombre VARCHAR(60) NOT NULL,
    Precio DECIMAL(6,3) NOT NULL,
    Cantidad INT NOT NULL,
    IdCatalogo INT NOT NULL,
    FOREIGN KEY (IdCatalogo) REFERENCES Catalogos(Id)
)

INSERT INTO Productos
(
  Nombre, Precio, Cantidad, IdCatalogo
)
VALUES (
    "Producto 1", 10000, 10, 1
)

DROP TABLE Catalogos

CREATE TABLE Catalogos(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    NumeroCampanha CHAR(12) NOT NULL,
    FechaCampanha VARCHAR(8) NOT NULL,
    LimiteFechaPedido VARCHAR(8) NOT NULL,
    IdEmpresa INT NOT NULL,
    FOREIGN KEY (IdEmpresa) REFERENCES Empresas(Id)
)

INSERT INTO Catalogos
(
  NumeroCampanha, FechaCampanha, LimiteFechaPedido, IdEmpresa
)
VALUES (
    "202310", "2020-01-01", "2020-01-01", 1
)

DROP TABLE Empresas

CREATE TABLE Empresas(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
)

INSERT INTO Empresas
(
  Nombre
)
VALUES (
    "Empresa 1"
)

DROP TABLE DetallesPedidosProductos

CREATE TABLE DetallesPedidosProductos(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IdPedido INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio DECIMAL(6,3) NOT NULL
    FOREIGN KEY (IdPedido) REFERENCES Pedidos(Id),
    FOREIGN KEY (IdProducto) REFERENCES Productos(Id)
)

INSERT INTO DetallesPedidosProductos
(
  IdPedido, IdProducto, Cantidad, Precio
)
VALUES (
    1, 1, 1, 10000
)