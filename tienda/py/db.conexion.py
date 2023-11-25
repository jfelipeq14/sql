import mysql.connector

# Conectarse a la base de datos
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="tienda"
)

if connection:
    id = int(input("Digite la factura a consultar: "))
    while id != 0:
        # Realizar una consulta
        cursor = connection.cursor()
        cursor.execute(f"SELECT * FROM factura WHERE factura.id = {id}")
        # Imprimir los resultados
        for row in cursor:
            print(row)
        id = int(input("Digite la tabla a consultar (0 para salir): "))

# Cerrar la conexión
connection.close()