#region import
    #Modulos a usar
import mysql.connector
import config
import querys
import tables
#endregion

#region atributos
opcion = 1
query = ""
data = ()
#endregion

#region funciones, metodos y mas
while opcion != 0:
    #region conexion
        # Conectarse a la base de datos
    connection = mysql.connector.connect(
        host=config.host,
        user=config.user,
        password=config.password,
        database=config.database
    )

    # Crear un objeto cursor para ejecutar consultas
    cursor = connection.cursor()
    #endregion

    #Menu de opciones
    print()
    print("¿Qué desea hacer?")
    print("1. Mostrar toda la tabla")
    print("2. Mostrar un registro")
    print("3. Insertar un registro")
    print("4. Crear procedimiento almacenado")
    print("5. Llamar procedimiento almacenado")
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
        values = tables.tableSelect(table)
        for i in values:
            values[i] = input(f"Digite el {i}: ")
            data += (values[i],)
        query = querys.insert(table, data)
    elif opcion == 4:
        query = querys.createProcedure()
    elif opcion == 5:
        fechaInicial = input("Digite la fecha inicial (AAAA-MM-DD): ")
        fechaFinal = input("Digite la fecha final (AAAA-MM-DD): ")
        query = querys.callProcedure(fechaInicial, fechaFinal)
    else:
        opcion = 0

    try:
        # Ejecutar la consulta
        cursor.execute(query)
        if opcion == 3:
            # Hacer commit para aplicar los cambios
            connection.commit()
        else:
            print(cursor.column_names)
            #Mostrar datos
            for row in cursor:
                print(row)

    except mysql.connector.Error as err:
        print(f"Error: {err}")

    finally:
        # Cerrar el cursor y la conexión
        cursor.close()
        connection.close()
    #Reinicializar variable (evita repetir la query)
    query = ""
    data = ()
#endregion