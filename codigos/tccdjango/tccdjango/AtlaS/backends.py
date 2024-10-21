from django.contrib.auth.backends import BaseBackend
from .models import Usuario

class EmailBackend(BaseBackend):
    def authenticate(self, request, username=None, password=None, **kwargs): # Função de autentificação
        try:
            usuario = Usuario.objects.get(email=username) # Definindo o email do usuário como username, já que o Django é padrão para logar por username
            if usuario.senha == password: # Definindo que senha será como o password, já que seria o padrão do Django usar variável password
                return usuario # Dará o retorno do usuário
        except Usuario.DoesNotExist:
            return None # Se o usuário não existir, retornará vazio

    def get_user(self, id_user): # Função para a validação do usuário pelo id
        try:
            return Usuario.objects.get(pk=id_user) # Definindo a primary key como o id do usuário
        except Usuario.DoesNotExist:
            return None 
