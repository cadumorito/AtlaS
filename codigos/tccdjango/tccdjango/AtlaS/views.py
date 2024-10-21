# Importando as biliotecas e informações de outros arquivos
from django.http.response import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login as login_django
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import smart_bytes
from django.utils.http import urlsafe_base64_encode
from django.core.mail import send_mail
from django.urls import reverse
from django.shortcuts import render
from django.contrib.auth.models import User
# views.py
from .models import Usuario, Categoria

from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuario, Categoria
from django.views.decorators.csrf import csrf_exempt

from django.shortcuts import render
from .models import Usuario


import os
from PIL import Image
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuario, Categoria
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings

@csrf_exempt # Adicionar meio que uma "segurança" para o formulário
def cadastro(request):
    # Função que se o método do formulário for POST, pedirá algumas informações a serem adicionadas de acordo com os campos de input
    if request.method == 'POST':
        nome = request.POST['nome']
        email = request.POST['email']
        senha = request.POST['senha']
        telefone = request.POST['telefone']
        imagem = request.FILES.get('imagem')
        id_categoria = request.POST.get('id_categoria')
        # Informações solicitadas no formulário

        try:
            categoria = Categoria.objects.get(id_categoria=int(id_categoria))
        except Categoria.DoesNotExist:
            return HttpResponse("Categoria não encontrada.", status=404)
        # Garantindo que a categoria, caso não existir por algum motivo, retornará como não encontrada

        # Cria o usuário antes de redimensionar a imagem para ter acesso ao id_user
        usuario = Usuario(
            nome=nome,
            email=email,
            senha=senha,
            telefone=telefone,
            id_categoria=categoria
        )
        usuario.save()  # Salva o usuário para obter o id_user
        # Está pegando as informações preenchidas e salvando como um usuário
        # Usuario() vem do models.py

        # Redimensiona e salva a imagem
        if imagem:
            # Cria as pastas se não existirem
            pasta_fotos = os.path.join('AtlaS', 'static', 'AtlaS', 'images', 'media', 'fotos_de_perfil') # Cada aspas é uma pasta
            os.makedirs(pasta_fotos, exist_ok=True) # Confere a existência das pastas

            # Redimensiona a imagem
            img = Image.open(imagem) # Abre a imagem 
            img = img.resize((500, 500), Image.LANCZOS) # Redimensiona a imagem para 500x500 pixels

            # Gera o novo nome de arquivo com a primeira palavra do nome e o id_user
            primeiro_nome = nome.split()[0].capitalize()  # Primeiro nome com a primeira letra maiúscula
            novo_nome = f"{primeiro_nome}{usuario.id_user}.png"  # Formato: Pedro3.png
            caminho_completo = os.path.join(pasta_fotos, novo_nome) # Pega o caminho completo

            # Salva a imagem na nova pasta
            img.save(caminho_completo)

            # Define o caminho da imagem para o banco de dados
            usuario.imagem = f'AtlaS/images/media/fotos_de_perfil/{novo_nome}'  # Caminho relativo
            usuario.save() # Salva o usuário

        messages.success(request, 'Usuário cadastrado com sucesso!') # Mensagem de sucesso
        return redirect('login') # Redireciona para outra página

    return render(request, 'cadastro.html') # Renderiza a página atual



# Função para requisitar a troca de senha da conta
def send_password_reset_email(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        # Pede para o email
        try:
            user = User.objects.get(email=email) # Define o user se o email existir
            token = default_token_generator.make_token(user) # Cria um token
            uid = urlsafe_base64_encode(smart_bytes(user.pk)) # Converte para a base64

            reset_link = request.build_absolute_uri(reverse('password_reset_confirm', args=[uid, token])) # Cria o link para resetar a senha

            subject = 'Password Reset Request'
            message = f'Click on the link to reset your password: {reset_link}'
            from_email = 'your_email@example.com'
            recipient_list = [email]
            # Informações que estarão no email
            send_mail(subject, message, from_email, recipient_list)
            # Função de enviar email pegando as informações acima

            # Renderiza com o sucesso
            return render(request, 'reset_senha.html', {'email': email, 'success_message': 'E-mail enviado com sucesso!'})

        except User.DoesNotExist:
            # Erro se algo estiver errado (se o usuário não existir)
            return render(request, 'reset_senha.html', {'error_message': 'Usuário não encontrado com esse email!'})

    else:
        return render(request, 'reset_senha.html') # Renderiza a tela atual


# AtlaS/views.py

from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login as auth_login
from django.contrib.auth.hashers import make_password
from .models import Usuario


# Função personalizada para verificar se o usuário está autenticado
def usuario_autenticado(request):
    return 'usuario_id' in request.session

# Imports para o  Login
from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect
from AtlaS.models import Usuario  # Certifique-se de usar o modelo correto
from django.contrib import messages

from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login

@csrf_exempt
def login_view(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        senha = request.POST.get('senha')
        usuario = authenticate(request, username=email, password=senha)

        if usuario is not None:
            login(request, usuario)
            return redirect('inicio')  # Redireciona para a página de 'inicio' após o login
        else:
            return render(request, 'login.html', {'error_message': 'Email ou senha incorretos'})

    return render(request, 'login.html')




# View de Página Protegida (Apenas para usuários autenticados)
def pagina_protegida(request):
    if not usuario_autenticado(request):
        return redirect('login')  # Redireciona para o login se não estiver autenticado
    
    # Caso o usuário esteja autenticado, buscamos as informações dele
    usuario = Usuario.objects.get(id_user=request.session['usuario_id'])
    return render(request, 'pagina_protegida.html', {'usuario': usuario})

# View de Logout
def logout_view(request):
    request.session.flush()  # Remove todas as informações da sessão
    return redirect('login')  # Redireciona para a página de login


## @csrf_exempt
def reset_senha(request):
    return render(request, 'reset_senha.html') # Apenas função para fazer a renderização da página com html

## @csrf_exempt
from django.shortcuts import render

def inicio(request):
    print("Usuário autenticado: ", request.user.is_authenticated)
    print("Usuário: ", request.user)
    return render(request, 'index.html', {'request': request})


## @login_required(login_url='login')


from django.shortcuts import render
from .models import Usuario 

# Função da tela demonstrativo
def demonstrativo(request):
    usuarios = Usuario.objects.all() # Define usuarios como todos os objetos do model Usuario

    # Adiciona o caminho da imagem para cada usuário
    for usuario in usuarios: # Para cada usuario em usuarios
        if usuario.imagem: # Se o usuário tiver imagem
            usuario.imagem_url = usuario.imagem  # Pega o caminho da imagem armazenado no banco de dados
        else:
            usuario.imagem_url = None # Caso não possuir, não terá a definição do caminho como variável

    return render(request, 'demonstrativo.html', {'usuarios': usuarios}) # Renderiza a tela atual puxando o html e  os usuários





# Função para obter a imagem
# def obter_imagem_usuario(request, id_user):
    try:
        usuario = Usuario.objects.get(id_user=id_user)
        if usuario.imagem:
            # Retorna a imagem como uma resposta HTTP
            return HttpResponse(usuario.imagem, content_type="image/jpeg")
        else:
            return HttpResponse('Imagem não disponível', status=404)
    except Usuario.DoesNotExist:
        return HttpResponse('Usuário não encontrado', status=404)




# Importando o model Cusos do models.py
from .models import Cursos
## @login_required(login_url='login') --> Login será requirid
@csrf_exempt # Garantia de "segurança" para o fomulário
def formulario(request):
    cursos = Cursos.objects.filter(status_curso=True)  # Filtra apenas os cursos com status ativo
    return render(request, 'formulario.html', {'cursos': cursos}) # Renderiza a tela atual com html e puxando as informações dos cursos

## @login_required(login_url='login')
@csrf_exempt
def minhas_reservas(request):
    return render(request, 'minhas_reservas.html') # Apenas função para fazer a renderização da página com html

## @login_required(login_url='login')
@csrf_exempt
def relatorio(request):
    return render(request, 'relatorio.html') # Apenas função para fazer a renderização da página com html

## @login_required(login_url='login')
@csrf_exempt
def reservas(request):
    return render(request, 'reservas.html') # Apenas função para fazer a renderização da página com html


