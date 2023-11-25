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
    cursor = connection.cursor()
    opcion = 1
    query = ""
    while opcion != 0:
        print()
        print("¿Qué desea hacer?")
        print("1. Mostrar toda la tabla")
        print("2. Mostrar un registro")
        print("0. Salir")
        opcion = int(input("Ingrese una opción: "))
        if opcion == 1:
            table = input("Digite la tabla: ")
            query = querys.getAll(table)
        elif opcion == 2:
            table = input("Digite la tabla: ")
            id = input("Digite el id: ")
            query = querys.getById(table, id)
        else:
            opcion = 0

        if query != "":
            cursor.execute(f"{query}")
        for row in cursor:
            print(row)
        query = ""
    # Cerrar la conexión
    connection.close()
else:
    print("No hay conexion con la base de datos :(")