from django import forms

class RegisterForm(forms.Form):
    username = forms.CharField(label="UserName")
    password = forms.CharField(label="Password", widget=forms.PasswordInput, required=False)
    email = forms.CharField(label="Email ID", required=False)
    contactno = forms.CharField(label="Contact No", max_length=10, required=False)

class BillForm(forms.Form):
    choices = [
        ('HP','HP'),
        ('Nokia','Nokia'),
        ('Samsung','Samsung'),
        ('Apple','Apple')
    ]
    choice2 = [
        ('Mobile','Mobile'),
        ('Laptop','Laptop')
    ]
    company = forms.ChoiceField(widget=forms.RadioSelect,choices=choices)
    company = forms.ChoiceField(choices=choices)

class MarksForm(forms.Form):
    name = forms.CharField(label="Name")
    marks = forms.CharField(label="Total marks")

