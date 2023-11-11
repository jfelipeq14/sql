-- informacion del cliente y la ciudad donde vive
-- lo que voy a mostrar
-- SELECCIONE
-- Que voy a mostrar
SELECT
    -- seleccione TODO lo del cliente
    cliente.*,
    ciudad.nombre -- Indicar de donde viene la informacion
FROM
    cliente,
    ciudad -- Donde (que se tiene que cumplir para mostrar la informacion)
WHERE
    -- indicar como se relaciona una tabla con otra
    -- la llave foranea (foreign key) con la llave primaria (primary key)
    cliente.idCiudad = ciudad.id