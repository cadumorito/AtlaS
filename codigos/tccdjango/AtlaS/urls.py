from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('demonstrativo/', views.demonstrativo, name='demonstrativo'),
    path('reservas', views.reservas, name='reservas'),
    path('reservas/formulario/', views.formulario, name='formulario'),
    path('minhas_reservas/', views.minhas_reservas, name='minhas_reservas'),
    path('relatorio/', views.relatorio, name='relatorio'),
    path('recuperar_senha/', views.reset_senha, name='reset_senha'),
    path('cadastro/', views.cadastro, name='cadastro'),
    path('login/', views.login, name='login'),
    
    # URL para enviar e-mail de recuperação de senha
    path('forgot_password/', views.send_password_reset_email, name='forgot_password'),

    # URL para redefinição de senha
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),

    # URLs adicionais do fluxo de redefinição de senha, se necessário
    path('reset_password/', auth_views.PasswordResetView.as_view(), name='reset_password'),
    path('reset_password_done/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset_password_complete/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),
]
