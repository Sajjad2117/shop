from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.forms import ModelForm

from .models import Customer


class CustomerForm(ModelForm):
    class Meta:
        model = Customer
        fields = ['username', 'email', 'profile_image']
        widgets = {
            'image': forms.FileInput(attrs={'class': 'form-control-file'})
        }


class CreateUser(UserCreationForm):
    class Meta:
        model = Customer
        fields = ['username', 'email', 'password1', 'password2']
        widgets = {
            'username': forms.TextInput(attrs={'type': 'text', 'placeholder': 'Sajjad'}),
            'email': forms.TextInput(attrs={'type': 'text', 'placeholder': 'sajjad@gmail.com'}),
            'password1': forms.TextInput(attrs={'type': 'password'}),
            'password2': forms.TextInput(attrs={'type': 'password'})
        }
