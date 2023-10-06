USE parqueadero

DROP TABLE users

CREATE TABLE users
(
  Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  First_name VARCHAR(60) NOT NULL,
  Last_name VARCHAR(60) NOT NULL,
  Document_number VARCHAR(25) NOT NULL,
  Description VARCHAR(250) NOT NULL,
  Role BIT NOT NULL,
)

-- Insert rows into table 'users'
INSERT INTO users
( -- columns to insert data into
 [Column1], [Column2], [Column3]
)
VALUES
( -- first row: values for the columns in the list above
 Column1_Value, Column2_Value, Column3_Value
),
( -- second row: values for the columns in the list above
 Column1_Value, Column2_Value, Column3_Value
)
-- add more rows here
GO

DROP TABLE vehicles

CREATE TABLE vehicles
(
  Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Plate VARCHAR(8) NOT NULL,
  Type_of_vehicle VARCHAR(12) NOT NULL,
  Owner VARCHAR(120) NOT NULL,
)

DROP TABLE facturacion

CREATE TABLE facturacion(
  Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Fecha_entrada DATETIME NOT NULL,
  Fecha_salida DATETIME NOT NULL,
  Valor DECIMAL(6,3) NOT NULL
)