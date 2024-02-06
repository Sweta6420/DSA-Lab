
from django.conf.urls import url 
from . import views  
  
urlpatterns = [  
    url(' ', views.index, name='index'),  
    url('q1', views.q1, name='q1'),  
    url('q2', views.q2, name='q2'),
]  