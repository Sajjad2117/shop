"""shop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from django.contrib.auth.views import (PasswordResetView,
                                       PasswordResetDoneView,
                                       PasswordResetConfirmView,
                                       PasswordResetCompleteView,
                                       )


urlpatterns = [
    path('admin/', admin.site.urls),
    path('customer/', include('customer.urls')),
    path('order/', include('order.urls')),
    path('', include('product.urls')),
    path('api/user/', include('customer.api.urls')),
    path('api/product/', include('product.api.urls')),
    path('api/order/', include('order.api.urls')),


    path('reset_password/',
         PasswordResetView.as_view(template_name='customer/reset_password.html'),
         name='reset_password'),

    path('reset_password_sent/',
         PasswordResetDoneView.as_view(template_name='customer/password_reset_done.html'),
         name='password_reset_done'),

    path('reset/<uidb64>/<token>/',
         PasswordResetConfirmView.as_view(template_name='customer/password_reset_confirm.html'),
         name='password_reset_confirm'),

    path('reset/done/', PasswordResetCompleteView.as_view(template_name='customer/password_reset_complete.html'),
         name='password_reset_complete'),

]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
