from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django import forms
from django.forms import ModelForm
from django.utils.translation import gettext_lazy as _

from .models import Customer


class CustomerLoginForm(AuthenticationForm):
    class Meta:
        model = Customer
        fields = ('username', 'password')


class CustomerRegisterForm(forms.Form):
    username = forms.CharField(max_length=100, label=_('Username'))
    email = forms.CharField(max_length=100, label=_('Email'))
    password = forms.CharField(max_length=100, widget=forms.PasswordInput, label=_('Password'))
    confirm_password = forms.CharField(max_length=100, widget=forms.PasswordInput, label=_('Confirm Password'))


class CustomerForm(ModelForm):
    class Meta:
        model = Customer
        fields = ['username', 'first_name', 'last_name', 'email', 'profile_image', ]
        widgets = {
            'profile_image': forms.FileInput(attrs={'class': 'form-control-file'})
        }


class ChangePasswordForm(forms.Form):
    old_password = forms.CharField(max_length=100, required=True, widget=forms.PasswordInput())
    new_password = forms.CharField(max_length=100, required=True, widget=forms.PasswordInput())
    new_password_check = forms.CharField(max_length=100, required=True, widget=forms.PasswordInput())

