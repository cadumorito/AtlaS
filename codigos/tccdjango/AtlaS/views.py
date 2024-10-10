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

from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuario, Categoria

from .models import Usuario, Categoria
from django.shortcuts import get_object_or_404

from django.http.response import HttpResponse
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuario, Categoria

from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuario, Categoria

from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuario, Categoria
from django.views.decorators.csrf import csrf_exempt

from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuario, Categoria
from django.views.decorators.csrf import csrf_exempt

from django.shortcuts import render, redirect
from AtlaS.models import Usuario, Categoria  # Certifique-se de que 'Usuario' é o modelo correto

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

@csrf_exempt
def cadastro(request):
    if request.method == 'POST':
        nome = request.POST['nome']
        email = request.POST['email']
        senha = request.POST['senha']
        telefone = request.POST['telefone']
        imagem = request.FILES.get('imagem')
        id_categoria = request.POST.get('id_categoria')

        try:
            categoria = Categoria.objects.get(id_categoria=int(id_categoria))
        except Categoria.DoesNotExist:
            return HttpResponse("Categoria não encontrada.", status=404)

        # Cria o usuário antes de redimensionar a imagem para ter acesso ao id_user
        usuario = Usuario(
            nome=nome,
            email=email,
            senha=senha,
            telefone=telefone,
            id_categoria=categoria
        )
        usuario.save()  # Salva o usuário para obter o id_user

        # Redimensiona e salva a imagem
        if imagem:
            # Cria a pasta se não existir
            pasta_fotos = os.path.join('AtlaS', 'static', 'AtlaS', 'images', 'media', 'fotos_de_perfil')
            os.makedirs(pasta_fotos, exist_ok=True)

            # Redimensiona a imagem
            img = Image.open(imagem)
            img = img.resize((500, 500), Image.LANCZOS)

            # Gera o novo nome de arquivo com a primeira palavra do nome e o id_user
            primeiro_nome = nome.split()[0].capitalize()  # Primeiro nome com a primeira letra maiúscula
            novo_nome = f"{primeiro_nome}{usuario.id_user}.png"  # Formato: Pedro3.png
            caminho_completo = os.path.join(pasta_fotos, novo_nome)

            # Salva a imagem na nova pasta
            img.save(caminho_completo)

            # Define o caminho da imagem para o banco de dados
            usuario.imagem = f'AtlaS/images/media/fotos_de_perfil/{novo_nome}'  # Caminho relativo
            usuario.save()

        messages.success(request, 'Usuário cadastrado com sucesso!')
        return redirect('login')

    return render(request, 'cadastro.html')




def send_password_reset_email(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        try:
            user = User.objects.get(email=email)
            token = default_token_generator.make_token(user)
            uid = urlsafe_base64_encode(smart_bytes(user.pk))

            reset_link = request.build_absolute_uri(reverse('password_reset_confirm', args=[uid, token]))

            subject = 'Password Reset Request'
            message = f'Click on the link to reset your password: {reset_link}'
            from_email = 'your_email@example.com'
            recipient_list = [email]

            send_mail(subject, message, from_email, recipient_list)

            # Pass success message to the template
            return render(request, 'reset_senha.html', {'email': email, 'success_message': 'E-mail enviado com sucesso!'})

        except User.DoesNotExist:
            # Pass error message to the template
            return render(request, 'reset_senha.html', {'error_message': 'Usuário não encontrado com esse email!'})

    else:
        return render(request, 'reset_senha.html')


def reset_password(request):
    return render(request, 'reset_password.html')


@csrf_exempt
def login(request):
    if request.method == 'GET':
        return render(request, 'login.html')
    else:
        email = request.POST.get('email')
        password = request.POST.get('password')

        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return render(request, 'login.html', {'error_message': 'E-mail ou senha incorretos!'})

        user = authenticate(username=user.username, password=password)

        if user:
            login_django(request, user)
            return render(request, 'login.html', {'success_message': 'Login realizado com sucesso!'})
        else:
            return render(request, 'login.html', {'error_message': 'E-mail ou senha incorretos!'})


## @login_required(login_url='login')
## def plataforma(request):
    return HttpResponse('Site apenas para usuários autenticados.')

## @csrf_exempt
def reset_senha(request):
    return render(request, 'reset_senha.html')

## @csrf_exempt
def inicio(request):
    return render(request, 'index.html')

## @login_required(login_url='login')


from django.shortcuts import render
from .models import Usuario  # Ajuste para importar seu modelo

def demonstrativo(request):
    usuarios = Usuario.objects.all()

    # Adiciona o caminho da imagem para cada usuário
    for usuario in usuarios:
        if usuario.imagem:
            usuario.imagem_url = usuario.imagem  # Caminho armazenado no banco de dados
        else:
            usuario.imagem_url = None

    return render(request, 'demonstrativo.html', {'usuarios': usuarios})






def obter_imagem_usuario(request, id_user):
    try:
        usuario = Usuario.objects.get(id_user=id_user)
        if usuario.imagem:
            # Retorna a imagem como uma resposta HTTP
            return HttpResponse(usuario.imagem, content_type="image/jpeg")
        else:
            return HttpResponse('Imagem não disponível', status=404)
    except Usuario.DoesNotExist:
        return HttpResponse('Usuário não encontrado', status=404)





from .models import Cursos
## @login_required(login_url='login')
@csrf_exempt
def formulario(request):
    cursos = Cursos.objects.filter(status_curso=True)  # Filtra apenas os cursos com status ativo
    return render(request, 'formulario.html', {'cursos': cursos})

## @login_required(login_url='login')
@csrf_exempt
def minhas_reservas(request):
    return render(request, 'minhas_reservas.html')

## @login_required(login_url='login')
@csrf_exempt
def relatorio(request):
    return render(request, 'relatorio.html')

## @login_required(login_url='login')
@csrf_exempt
def reservas(request):
    return render(request, 'reservas.html')


