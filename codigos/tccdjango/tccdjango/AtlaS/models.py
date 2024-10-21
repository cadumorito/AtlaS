from django.db import models

class Categoria(models.Model): # Classe categoria pegando as funcionalidades models
    id_categoria = models.AutoField(primary_key=True) # Definindo campo que se preenche sozinho e como chave primária
    nome = models.CharField(max_length=100) # Variável nome como varchar de no máximo 100 caracteres
    def __str__(self):
        return self.nome  # Retorna o nome da categoria
    class Meta:
        db_table = 'categorias'  # Nome da tabela no banco de dados


from django.db import models


class Usuario(models.Model):
    id_user = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=100)
    email = models.EmailField(unique=True) 
    senha = models.CharField(max_length=128) 
    telefone = models.CharField(max_length=20)
    id_categoria = models.ForeignKey('Categoria', on_delete=models.CASCADE) # Está puxando informação de outra tabela ou model
    imagem = models.ImageField(blank=True, null=True)
    last_login = models.DateTimeField(null=True, blank=True)  # Adiciona este campo
    is_authenticated = models.BooleanField
    # Está definindo como variável e características do preenchimento das informações

    class Meta:
        db_table = 'usuarios' # Nome da tabela no banco de dados


from django.db import models

from django.db import models

class Cursos(models.Model):
    id_curso = models.AutoField(primary_key=True)
    nome_curso = models.CharField(max_length=100)
    status_curso = models.BooleanField()
    # Está definindo como variável e características do preenchimento das informações

    class Meta:
        db_table = 'cursos' # Nome da tabela no banco de dados


    def __str__(self):
        return self.nome_curso # Retornando o nome do curso

