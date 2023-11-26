#region atributos
    #Modulos a usar
import mysql.connector
import json
import config
import querys
import tables
#endregion

#region conexion
    # Conectarse a la base de datos
connection = mysql.connector.connect(
    host=config.host,
    user=config.user,
    password=config.password,
    database=config.database
)
#endregion

#region funciones, metodos y mas
    #Validar la conexion a la base de datos
if connection:
    opcion = 1
    query = ""

    while opcion != 0:
        #Menu de opciones
        print()
        print("¿Qué desea hacer?")
        print("1. Mostrar toda la tabla")
        print("2. Mostrar un registro")
        print("3. Insertar un registro")
        print("0. Salir")
        #Opcion del menu
        opcion = int(input("Ingrese una opción: "))
        #Validar opcion
        if opcion == 1:
            #Datos para la consulta
            table = input("Digite la tabla: ")
            #Consulta a ejecutar (viene del archivo querys)
            query = querys.getAll(table)
        elif opcion == 2:
            #Datos para la consulta
            table = input("Digite la tabla: ")
            id = input("Digite el id: ")
            #Consulta a ejecutar (viene del archivo querys)
            query = querys.getById(table, id)
        elif opcion == 3:
            #Datos para la consulta
            table = input("Digite la tabla: ")
            data = tables.tableSelect(table)
            for i in data:
                data[i] = input(f"Digite el {i}: ")
            #Para revisar:
            # valores = ""
            # for value in data.values():
            #     valores += f"'{value}'"
            # #Consulta a ejecutar (viene del archivo querys)
            # query = querys.insert(table, data)
        else:
            opcion = 0

        if query != "":
            #Ejecutar la consulta
            cursor = connection.cursor()
            cursor.execute(f"{query}")
            print(cursor.column_names)
            #Mostrar datos
            for row in cursor:
                print(row)
        #Reinicializar variable (evita repetir la query)
        query = ""

    # Cerrar la conexión
    connection.close()
else:
    print("No hay conexion con la base de datos :(")
#endregion