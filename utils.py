#Método para ler arquivo *SQL

def read_sql(file_path):
    with open(file_path, 'r') as file:
        return file.read()
