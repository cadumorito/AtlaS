# Importando bibliotecas e informações de outros arquivos, como o views

from django.urls import path
from . import views
from django.contrib.auth import views as auth_views
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from . import views

# Definindo algumas urls da nossa aplicação
# Urls com as funções de renderização do view.py
urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('demonstrativo/', views.demonstrativo, name='demonstrativo'),
    path('reservas', views.reservas, name='reservas'),
    path('reservas/formulario/', views.formulario, name='formulario'),
    path('minhas_reservas/', views.minhas_reservas, name='minhas_reservas'),
    path('relatorio/', views.relatorio, name='relatorio'),
    path('recuperar_senha/', views.reset_senha, name='reset_senha'),
    path('cadastro/', views.cadastro, name='cadastro'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('protegida/', views.pagina_protegida, name='pagina_protegida'),
    
    # URL para enviar e-mail de recuperação de senha
    path('forgot_password/', views.send_password_reset_email, name='forgot_password'),

    # URL para redefinição de senha
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)