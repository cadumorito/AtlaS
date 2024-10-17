from django.db import models

class Categoria(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=100)
    def __str__(self):
        return self.nome  # Retorna o nome da categoria
    class Meta:
        db_table = 'categorias'  # Nome da tabela no banco de dados


from django.db import models

class Usuario(models.Model):
    id_user = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=100)
    email = models.EmailField(unique=True)  # Certifique-se de que o email seja único
    senha = models.CharField(max_length=128)  # Campo para senha
    telefone = models.CharField(max_length=20)
    id_categoria = models.ForeignKey('Categoria', on_delete=models.CASCADE)
    imagem = models.ImageField(blank=True, null=True)

    class Meta:
        db_table = 'usuarios'


from django.db import models

from django.db import models

class Cursos(models.Model):
    id_curso = models.AutoField(primary_key=True)
    nome_curso = models.CharField(max_length=100)
    status_curso = models.BooleanField()

    class Meta:
        db_table = 'cursos'


    def __str__(self):
        return self.nome_curso

