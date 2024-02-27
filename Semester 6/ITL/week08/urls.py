
from django.conf.urls import url
from . import views  
  
urlpatterns = [  
    #url('', views.home,name='home'),  
    #url('login', views.login,name='login'),  
    url('q1/', views.q1, name="q1"),
    url('newpage/', views.q1newpage, name="q1newpage"),
    url('q2/', views.q2, name='q2'),
    url('secondpage/', views.secondpage, name='secondpage'),
]  