from django.urls import path

from customer.api import views

app_name = "customer"

urlpatterns = [
    # ex: api/user/login/
    # path("login/", views.LoginView.as_view(), name="Login"),
    # # ex: api/user/register/
    # path("register/", views.RegisterView.as_view(), name="Register"),

    path("login/", views.UserLoginAPIView.as_view(), name="Login"),
    path("register/", views.UserRegistrationAPIView.as_view(), name="Register"),
]
