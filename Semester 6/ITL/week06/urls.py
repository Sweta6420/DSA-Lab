from django.conf.urls import url
from . import views

urlpatterns = [
    #url('',views.index,name='index'),
    url('q1',views.q1,name='q1'),
    url('q2',views.q2,name='q2'),
    url('q3',views.q3,name='q3'),
    url('meta',views.meta,name='meta'),
    url('review',views.review,name='review'),
    url('publish',views.publish,name='publish'),
]
