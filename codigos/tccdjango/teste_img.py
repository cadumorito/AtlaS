import MySQLdb

# Conectar ao banco de dados
db = MySQLdb.connect("localhost", "root", "devmysql", "AtlaS")
cursor = db.cursor()

try:
    # Executar uma consulta para obter a imagem
    id_user = 1  # ID do usuário que você deseja recuperar
    cursor.execute("SELECT imagem FROM usuarios WHERE id_user = %s", (id_user,))
    resultado = cursor.fetchone()

    if resultado and resultado[0] is not None:
        imagem_binaria = resultado[0]

        # Salvar a imagem em um arquivo
        with open('imagem_usuario.jpg', 'wb') as f:
            f.write(imagem_binaria)
        print("Imagem salva como 'imagem_usuario.jpg'")
    else:
        print("Nenhuma imagem encontrada para o usuário com ID:", id_user)

except Exception as e:
    print("Ocorreu um erro:", e)

finally:
    # Fechar a conexão
    db.close()
