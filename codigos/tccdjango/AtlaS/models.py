from django.db import models

class Categoria(models.Model):
    nome = models.CharField(max_length=100)

    def __str__(self):
        return self.nome

from django.db import models


class Usuario(models.Model):
    id_user = models.AutoField(primary_key=True)  # Definindo id_usuario como chave primária
    nome = models.CharField(max_length=100)
    email = models.EmailField()
    senha = models.CharField(max_length=50)
    telefone = models.CharField(max_length=20)
    id_categoria = models.ForeignKey('Categoria', on_delete=models.CASCADE)  # Chave estrangeira para categorias
    imagem = models.BinaryField(blank=True, null=True) 

    class Meta:
        db_table = 'usuarios'  # Opcional: define o nome da tabela no banco de dados

