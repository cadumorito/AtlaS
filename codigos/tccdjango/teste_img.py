import MySQLdb

# Conectar ao banco de dados
db = MySQLdb.connect("localhost", "root", "devmysql", "AtlaS")
cursor = db.cursor()

try:
    # Executar uma consulta para obter a imagem
    usuario_id = 1  # ID do usuário que você deseja recuperar
    cursor.execute("SELECT imagem FROM atlas_usuario WHERE id = %s", (usuario_id,))
    resultado = cursor.fetchone()

    if resultado and resultado[0] is not None:
        imagem_binaria = resultado[0]

        # Salvar a imagem em um arquivo
        with open('imagem_usuario.jpg', 'wb') as f:
            f.write(imagem_binaria)
        print("Imagem salva como 'imagem_usuario.jpg'")
    else:
        print("Nenhuma imagem encontrada para o usuário com ID:", usuario_id)

except Exception as e:
    print("Ocorreu um erro:", e)

finally:
    # Fechar a conexão
    db.close()
