from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from .models import *
from .forms import *


# @login_required
def update_customer(request):
    # customer = request.user
    form = CustomerForm(instance=request.user)
    if request.method == 'POST':
        form = CustomerForm(request.POST, request.FILES, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('product:index')
    context = {'form': form}
    return render(request, 'customer/profile.html', context)


def login_page(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
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
