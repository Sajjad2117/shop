from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect
from .models import *
from .forms import *


def login_page(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        password = request.POST.get('password')
        user = authenticate(request, name=name, password=password)
        if user is not None:
            login(request, user)
            return redirect('product:index')
    return render(request, 'customer/login.html')


def register_page(request):
    form = CreateUser()
    if request.method == 'POST':
        form = CreateUser(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')

    context = {'form': form}
    return render(request, 'customer/register.html', context)


def logout_view(request):
    logout(request)
    return redirect('product:index')