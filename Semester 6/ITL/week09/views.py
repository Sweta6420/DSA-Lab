from django.shortcuts import render

# Create your views here.
from django.http import HttpRequest, HttpResponseRedirect
from django.shortcuts import render,redirect

from .forms import RegisterForm,MarksForm

# Create your views here.
def register(request: HttpRequest):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            context = {
                'username': form.cleaned_data['username'],
                'password': form.cleaned_data['password'],
                'email': form.cleaned_data['email'],
                'contactno': form.cleaned_data['contactno'],
            }
            request.session['context'] = context
            return redirect('/success/',context)
    form = RegisterForm()
    return render(request, 'register.html', {'form': form})

def success(request: HttpRequest):
    if request.session.has_key('context'):
        return render(request, 'success.html', {'context': request.session['context']})
    return render(request, 'success.html', {})

def marks(request: HttpRequest):
    if request.method == 'POST':
        form = MarksForm(request.POST)
        if form.is_valid():
            marks = int(form.cleaned_data['marks'])/50
            context = {
                'name': form.cleaned_data['name'],
                'marks': marks,
            }
            request.session['context'] = context
            return redirect('/result/',context)
    form = MarksForm()
    return render(request, 'marks.html', {'form': form})

def result(request: HttpRequest):
    if request.session.has_key('context'):
        return render(request, 'result.html', {'context': request.session['context']})
    return render(request, 'result.html', {})