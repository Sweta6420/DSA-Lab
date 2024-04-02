from operator import mod
from django import forms
from . import models

#Q1
class AuthorForm(forms.ModelForm):
    class Meta:
        model = models.AuthorModel
        exclude = ('',)

class PublisherForm(forms.ModelForm):
    class Meta:
        model = models.PublisherModel
        exclude = ('',)

class BookForm(forms.ModelForm):
    date = forms.DateField(input_formats=['%d/%m/%Y'])
    class Meta:
        model = models.BookModel
        exclude = ('',)

#Q2
class ProductForm(forms.ModelForm):
    class Meta:
        model = models.ProductModel
        exclude = ('',)

#Q3
class HumanForm(forms.ModelForm):
    class Meta:
        model = models.HumanModel
        exclude = ('',)