
from django import forms   
class RegForm(forms.Form):   
    title = forms.CharField()
    description = forms.CharField()
    views = forms.IntegerField()      
    available = forms.BooleanField()  

class GeeksForm(forms.Form):   
    title = forms.CharField(widget = forms.Textarea)   
    description = forms.CharField(widget = forms.CheckboxInput)      
    views = forms.IntegerField(widget = forms.TextInput)      
    available = forms.BooleanField(widget = forms.Textarea) 

class LoginForm(forms.Form):
    username = forms.CharField(max_length = 100)    
    contact_num = forms.IntegerField()  

class CarForm(forms.Form):
    choices = [
        ('Suzuki', 'Suzuki'),
        ('Toyota', 'Toyota'),
        ('Honda', 'Honda'),
    ]
    manufacturer = forms.ChoiceField(label="Car Manufacturer", choices=choices)
    model_name = forms.CharField(label="Model Name")

class FirstForm(forms.Form):
    choices = [
        ('Math', 'Math'),
        ('English', 'English'),
        ('Physics', 'Physics'),
    ]
    name = forms.CharField(label="Name")
    roll = forms.CharField(label="Roll")
    subject = forms.ChoiceField(label="Subject", choices=choices)