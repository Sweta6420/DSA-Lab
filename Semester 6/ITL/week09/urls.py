
from django.urls import path
from . import views

urlpatterns = [
    path('register/', views.register, name='register'),
    path('success/', views.success, name='success'),
    path('marks/', views.marks, name='marks'),
    path('result/', views.result, name='result'),
]