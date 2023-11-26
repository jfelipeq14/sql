def tableSelect(table):
    
    if table == "cajero" or table == "cliente":
        return ({
            "id": "",
            "nombre": "",
            "celular": "",
            "email": "",
            "idCiudad": ""
        })
    elif table == "categoria":
        return ({
            "id": "",
            "nombre": ""
        })
    elif table == "ciudad":
        return ({
            "id": "",
            "nombre": "",
            "idDepartamento": ""
        })
    elif table == "departamento":
        return ({
            "id": "",
            "nombre": "",
            "idPais": ""
        })
    elif table == "detallefacturaproducto":
        return ({
            "idFactura": "",
            "idProducto": "",
            "precio": "",
            "cantidad": ""
        })
    elif table == "domiciliario":
        return ({
            "id": "",
            "nombre": "",
            "celular": ""
        })
    elif table == "domicilio":
        return ({
            "idFactura": "",
            "idDomiciliario": "",
            "valor": ""
        })
    elif table == "factura":
        return ({
            "id": "",
            "fecha": "",
            "idCliente": "",
            "idCajero": ""
        })
    elif table == "pais":
        return ({
            "id": "",
            "nombre": ""
        })
    elif table == "producto":
        return ({
            "id": "",
            "nombre": "",
            "idCategoria": "",
            "precio": "",
            "exitencia": ""
        })