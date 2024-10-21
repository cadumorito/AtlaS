import mysql.connector

def print_usuarios():
    # Conexão com o banco de dados
    try:
        connection = mysql.connector.connect(
            host='localhost',  # Altere se necessário
            user='root',  # Substitua pelo seu usuário do MySQL
            password='devmysql',  # Substitua pela sua senha do MySQL
            database='AtlaS'  # Nome do seu banco de dados
        )

        if connection.is_connected():
            cursor = connection.cursor(dictionary=True)  # Usar dicionário para facilitar a leitura
            cursor.execute("SELECT * FROM usuarios")  # Execute a consulta para selecionar todos os usuários
            
            # Obtenha todos os resultados
            usuarios = cursor.fetchall()
            
            # Imprima os dados dos usuários
            for usuario in usuarios:
                print(usuario)

    except mysql.connector.Error as err:
        print(f"Erro: {err}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("Conexão encerrada.")

if __name__ == "__main__":
    print_usuarios()
