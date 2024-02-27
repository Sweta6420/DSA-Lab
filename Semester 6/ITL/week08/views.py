from django.shortcuts import render,redirect
from django.http import HttpRequest, HttpResponse, HttpResponseRedirect
from .forms import RegForm,GeeksForm,LoginForm,CarForm,FirstForm

#def home(request):   
#    context = {}      
#    form1 =  RegForm(request.POST or None)    
#    form2 = GeeksForm(request.POST or None)
#    context['form1'] = form1   
#    context['form2'] = form2
#    return render(request, "home.html", context) 

#def login(request):
#    username = "not logged in"    
#    cn="not found"    
#    if request.method == "POST":  
#        MyLoginForm = LoginForm(request.POST)          
#    if MyLoginForm.is_valid():  
#        username = MyLoginForm.cleaned_data['username']           
#        cn= MyLoginForm.cleaned_data['contact_num']  
#    else:  
#        MyLoginForm = LoginForm()  
#    context = {'username': username,'contact_num':cn}  
#    return render(request, "loggedin.html", context)

def q1(request: HttpRequest):
    form = CarForm()
    return render(request, 'q1.html', {'form':form})


def q1newpage(request):
    if request.method == 'POST':
        form = CarForm(request.POST)
        if form.is_valid():
            context = {
                'manufacturer': form.cleaned_data['manufacturer'],
                'model_name': form.cleaned_data['model_name'],
            }
            return render(request, 'q1newpage.html', context)
    return HttpResponse("Invalid Parameters")

def q2(request: HttpRequest):
    context = {
        'name': None,
        'roll': None,
        'subject': None,
    }
    if request.method == 'POST':
        ff = FirstForm(request.POST)
        if ff.is_valid():
            context = {
                'name': ff.cleaned_data['name'],
                'roll': ff.cleaned_data['roll'],
                'subject': ff.cleaned_data['subject'],
            }
            request.session['context'] = context
            return redirect('/secondpage/')
    ff = FirstForm()
    return render(request, 'q2.html', {'form': ff})

def secondpage(request: HttpRequest):
    if request.method == 'POST':
        del request.session['context']
        return redirect('/q2/')

    if request.session.has_key('context'):
        return render(request, 'secondPage.html', {'context':request.session['context']})
    
    return render(request, 'secondPage.html', {})