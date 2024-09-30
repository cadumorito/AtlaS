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
def cadastro(request):
    if request.method == 'POST':
        # Get form data
        name = request.POST.get('name')
        number = request.POST.get('number')
        email = request.POST.get('email')
        password = request.POST.get('password')

        # Check if user already exists
        if User.objects.filter(name=name).exists():
            return render(request, 'cadastro.html', {'error_message': 'Já existe um usuário com esse username'})
        
        if User.objects.filter(email=email).exists():
            return render(request, 'cadastro.html', {'error_message': 'Já existe um usuário com esse e-mail.'})
        
        if User.objects.filter(number=number).exists():
            return render(request, 'cadastro.html', {'error_message': 'Já existe um usuário com esse e-mail.'})
        
        # Create new user
        try:
            user = User.objects.create_user(username=name, number=number, email=email, password=password)
            user.save()
            return render(request, 'cadastro.html', {'success_message': 'Usuário criado com sucesso!'})
        except Exception as e:
            return render(request, 'cadastro.html', {'error_message': f'Erro ao criar usuário: {str(e)}'})

    # Handle GET request
    return render(request, 'cadastro.html')

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
@csrf_exempt
def demonstrativo(request):
    return render(request, 'demonstrativo.html')

## @login_required(login_url='login')
@csrf_exempt
def formulario(request):
    return render(request, 'formulario.html')

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


