from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    # Uncomment the next line to enable the admin:
    path('', views.index, name='index'),
    path('create/', views.create, name='create'),
    path('createbook/', views.createbook, name='createbook'),
    path('index', views.indexprod, name='add'),
    path('addprod/', views.addprod, name='addprod'),
    path('createprod/', views.createprod, name='createprod'),
    path('addhuman/', views.addhuman, name='addhuman'),
    path('createhuman/', views.createhuman, name='createhuman'),
    path('update',views.update,name='update'),

]