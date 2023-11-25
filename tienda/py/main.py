import mysql.connector
import config
import querys

# Conectarse a la base de datos
connection = mysql.connector.connect(
    host=config.host,
    user=config.user,
    password=config.password,
    database=config.database
)

if connection:
    opcion = 1
    while opcion != 0:
        print()
        print("¿Qué desea hacer?")
        print("1. Mostrar toda la tabla")
        print("2. Mostrar un registro")
        print("0. Salir")
        opcion = int(input("Ingrese su opción: "))
        if opcion == 1:
            table = input("Digite la tabla: ")
            query = querys.getAll(table)
        elif opcion == 2:
            table = input("Digite la tabla: ")
            id = input("Digite el id: ")
            query = querys.getById(table, id)
        if query:
            # Realizar una consulta
            cursor = connection.cursor()
            cursor.execute(f"{query}")
            # Imprimir los resultados
            print()
            for row in cursor:
                print(row)
else:
    print("No hay conexion con la base de datos :(")

# Cerrar la conexión
connection.close()