use tienda;

-- Mostrar todos los departamentos
select * from domiciliario;

-- mostra nombre de la ciudad y nombre del departamento
SELECT ciudad.nombre, departamento.nombre 
	FROM ciudad, departamento
		WHERE ciudad.idDepartamento = departamento.id;

-- mostrar nombre de la ciudad y nombre del departamento de los municipios de antioquia
SELECT ciudad.nombre, departamento.nombre
	FROM CIUDAD, departamento 
		WHERE	ciudad.idDepartamento = departamento.id and
				departamento.nombre='antioquia';

-- mostrar la factura numero 2 solo los datos que esten en la tabla.
SELECT * 
	FROM factura
		WHERE factura.id = 2;

-- mostrar la factura numero 2, datos del cliente completos con id de ciudad y con id de cajero que lo atendio
SELECT * 
	FROM factura, cliente
		WHERE	factura.idCliente = cliente.id AND
				factura.id = 2;

-- mostrar la factura numero 5, datos del cliente completos con id de ciudad y nombre ciudad y con id de cajero y nombre cajero que lo atendio
SELECT * 
	FROM factura, cliente, ciudad, cajero
		WHERE	factura.idCliente = cliente.id AND
				ciudad.id = cliente.idCiudad AND
				factura.idCajero = cajero.id AND
				factura.id = 5;

-- mostrar la factura numero 4, datos del cliente, nombre de la ciudad y el departamento y el nombre de los productos que compro con el nombre de la categoria ordenado por categoria 
SELECT factura.*, cliente.*, ciudad.nombre, departamento.nombre, producto.nombre, categoria.nombre
	FROM departamento, ciudad, cliente, factura, detalleFacturaProducto, producto, categoria
		WHERE departamento.id = ciudad.idDepartamento AND
				ciudad.id = cliente.idCiudad AND
				cliente.id = factura.idCliente AND
				factura.id  = detalleFacturaProducto.idFactura AND
				detalleFacturaProducto.idProducto = producto.id AND
				producto.idCategoria = categoria.id AND
				factura.id=4
				ORDER BY categoria.nombre;

-- Listar el nombre del pais, del departamento, de la ciuadad y del cajero de todas las facturas ordenadas descendentemente por factura. ojo que los titulos se presenten de acuerdo a la tabla.
SELECT	pais.nombre AS pais,
		departamento.nombre as 'departamento',
		ciudad.nombre as ciudad,
		cajero.nombre as cajero, factura.id, factura.fecha
	FROM pais, departamento, ciudad,cliente, cajero, factura
		WHERE	pais.id = departamento.idPais AND
				departamento.id = ciudad.idDepartamento AND
				ciudad.id = cliente.idCiudad AND
				cliente.id = factura.idCliente AND
				factura.idCajero = cajero.id
		order by  factura.id desc;

-- mostrar la factura 2 completa con los productos vendidos, el cajero y el cliente que se vendieron con categoria frutas

SELECT factura.*,producto.nombre,cajero.nombre,cliente.nombre,categoria.nombre
	FROM factura,categoria,detalleFacturaProducto,producto,cajero,cliente
		WHERE categoria.id =producto.idcategoria AND
				producto.id = detalleFacturaProducto.idproducto AND
				detalleFacturaProducto.idFactura = factura.id AND
				factura.idCajero = cajero.id AND
				factura.idCliente = cliente.id AND
				factura.id = 2 AND
				categoria.nombre = 'frutas';

-- mostrar todas las facuras vendidas en el mes de noviembre con toda la informacion
SELECT *
	FROM factura
		WHERE fecha BETWEEN '2023-11-01' AND '2023-11-30';

-- mostrar los domicilios entregados por cada domiciliario
SELECT domicilio.*, domiciliario.nombre AS Domiciliario
	FROM domicilio, domiciliario
		WHERE domicilio.idDomiciliario = domiciliario.id
        ORDER BY domiciliario.nombre;

-- mostrar las facturas agrupadas por cada cajero que lo atendio
SELECT factura.*, cajero.nombre AS Cajero
	FROM factura, cajero
		WHERE factura.idCajero = cajero.id
        GROUP BY cajero.nombre;

-- mostrar las facturas agrupadas por cliente ordendadas por nombre del cliente
SELECT factura.*, cliente.nombre AS Cliente
	FROM factura, cliente
		WHERE cliente.id = factura.idCliente
        GROUP BY cliente
        ORDER BY cliente.nombre ASC;

-- mostrar la factura vendida con el mayor precio para darle un premio del 2% del valor de la factura
SELECT
	MAX(precio) AS Precio
	,(MAX(precio) * 0.2) AS Premio
FROM detallefacturaproducto;

-- mostrar el cajero que mas facturas atiende
SELECT idCajero, count(idCajero) AS Total
	FROM factura
    GROUP BY idCajero
    ORDER BY Total DESC
    LIMIT 1;

-- Mostrar todas las facturas emitidas en el año 2023 y que tengan domicilio.

SELECT factura.*
	FROM factura, domicilio
		WHERE domicilio.idFactura = factura.id
        AND factura.fecha between "2023-01-01" and "2023-12-31";

-- Mostrar todas las facturas que tengan productos de categoria verduras y tengan domicilio.
SELECT factura.*
	FROM factura, domicilio, detallefacturaproducto, producto, categoria
		WHERE domicilio.idFactura = factura.id
        AND factura.id = detallefacturaproducto.idFactura
        AND detallefacturaproducto.idProducto = producto.id
        AND producto.idCategoria = categoria.id
        AND categoria.nombre = "verduras";
        
-- Mostrar la factura 5 y que incluya la informacion del cliente con su ciudad y ordenar los productos por categoria de forma descendente.
SELECT factura.*, cliente.*, ciudad.nombre AS Ciudad, producto.nombre AS Producto, categoria.nombre AS Categoria
	FROM factura, cliente, ciudad, producto, detallefacturaproducto, categoria
		WHERE factura.id = 5
        AND factura.idCliente =  cliente.id
        AND cliente.idCiudad = ciudad.id
        AND detallefacturaproducto.idFactura = factura.id
        AND detallefacturaproducto.idProducto = producto.id
        AND producto.idCategoria = categoria.id
	ORDER BY categoria.nombre DESC;

-- Mostrar todas las facturas emitidas en medellin, que sus productos sean frutas y la informacion este ordenada por cliente.
SELECT factura.*,ciudad.nombre,producto.nombre,categoria.nombre,cliente.nombre
	FROM ciudad,cliente,factura,detallefacturaproducto,producto,categoria
		WHERE ciudad.id = cliente.idCiudad
		AND cliente.id = factura.idCliente
		AND factura.id = detallefacturaproducto.idFactura
		AND detallefacturaproducto.idProducto = producto.id
		AND producto.idCategoria = categoria.id
		AND categoria.nombre = 'frutas'
        AND ciudad.nombre= 'Medellin'
	ORDER BY cliente.nombre;

-- Mostrar los detalles de la factura 1 y ordenar por el cliente.

-- Mostrar todas las facturas que tengan productos de la categoria de frutas.

-- Create Stored Procedure
DELIMITER //
CREATE PROCEDURE obtenerFacturasPorFecha(
    IN fechaInicial date, fechaFinal date
)
BEGIN
    SELECT * FROM factura WHERE fecha BETWEEN fechaInicial AND fechaFinal;
END //
DELIMITER ;