from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.generic import FormView

from .models import *
from .forms import *


class RegisterView(FormView):
    form_class = CustomerRegisterForm
    template_name = 'customer/register.html'

    def get_success_url(self):
        return reverse('customer/login.html')


class LoginUserView(LoginView):
    authentication_form = CustomerLoginForm
    # redirect_field_name = 'next'
    template_name = 'customer/login.html'
    # redirect_authenticated_user = True

    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            if 'next' in request.GET:
                return HttpResponseRedirect(request.GET['next'])
            return redirect('product:index')
        return super().get(request, *args, **kwargs)


# def login_view(request):
#     if request.method == 'POST':
#         username = request.POST.get('username')
#         password = request.POST.get('password')
#         user = authenticate(request, username=username, password=password)
#         if user is not None:
#             login(request, user)
#             return redirect('product:index')
#     return render(request, 'customer/login.html')
#
#
# def register_view(request):
#     form = CustomerRegisterForm()
#     if request.method == 'POST':
#         form = CustomerRegisterForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('customer:login')
#     context = {'form': form}
#     return render(request, 'customer/register.html', context)


def logout_view(request):
    logout(request)
    return redirect('product:index')


@login_required
def edit_profile_view(request):
    customer = Customer.objects.get(id=request.user.id)
    form = CustomerForm(instance=customer)
    if request.method == 'POST':
        form = CustomerForm(request.POST, request.FILES, instance=customer)
        if form.is_valid():
            form.save()
            return redirect('product:index')
    context = {'form': form}
    return render(request, 'customer/edit_profile.html', context)


