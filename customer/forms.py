from django.contrib.auth.forms import UserCreationForm
from django import forms
from .models import Customer


class CreateUser(UserCreationForm):
    class Meta:
        model = Customer
        fields = ['name', 'email', 'password1', 'password2']
        widgets = {
            'name': forms.TextInput(attrs={'type': 'text', 'placeholder': 'Sajjad'}),
            'email': forms.TextInput(attrs={'type': 'text', 'placeholder': 'sajjad@gmail.com'}),
            'password1': forms.TextInput(attrs={'type': 'password'}),
            'password2': forms.TextInput(attrs={'type': 'password'})
        }
