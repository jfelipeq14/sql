
def getAll(table):
    if table:
        return(f"SELECT * FROM {table}")

def getById(table, id) :
    if table and id:
        return (f"SELECT * FROM {table} WHERE id = {id}")

def insert(table, data):
    if table and data:
        return(f"INSERT INTO {table} VALUES {data}")

def update(table ,data, id):
    if table and data and id:
        return(f"UPDATE {table} SET {data} WHERE id = {id}")