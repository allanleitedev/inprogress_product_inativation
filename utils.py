#Método para ler arquivo *SQL

def read_sql(file_path):
    with open(file_path, 'r') as file:
        return file.read()

#Método para retornar a engine de conexão do banco de dados, baseado no .env

def pg_engine():
    from dotenv import load_dotenv
    import os
    from sqlalchemy import create_engine
    
    load_dotenv()
    
    env = {
        'user':os.getenv("USER"),
        'password':os.getenv("PASSWORD"),
        'host':os.getenv("HOST"),
        'port':os.getenv("PORT"),
        'database':os.getenv("DATABASE")            
    }

    return create_engine(f'postgresql+psycopg2://{env['user']}:{env['password']}@{env['host']}:{env['port']}/{env['database']}')

def printtest():
    print('Utils method')
            
