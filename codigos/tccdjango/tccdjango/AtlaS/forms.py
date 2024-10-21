# Importando a biblioteca do Django
from django import forms

class LoginForm(forms.Form):
    email = forms.EmailField(label='Email', max_length=100)
    senha = forms.CharField(label='Senha', widget=forms.PasswordInput)
    # Apenas criando um formulário solicitando email e senha
