from django.shortcuts import render

# Create your views here.
#def index(request):
#   return render(request,'index.html')

def q1(request):
    return render(request,'q1.html')

def q2(request):
    return render(request,'q2.html')

def q3(request):
    return render(request,'q3.html')

def meta(request):
    return render(request,'meta.html')

def review(request):
    return render(request,'review.html')

def publish(request):
    return render(request,'publish.html')