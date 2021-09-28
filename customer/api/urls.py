from django.urls import path

from .views import RegisterView

app_name = "customer"

urlpatterns = [
    # ex: api/user/login/
    # path("login/", views.LoginView.as_view(), name="Login"),
    # # ex: api/user/register/
    # path("register/", views.RegisterView.as_view(), name="Register"),

    # path("login/", UserLoginAPIView.as_view(), name="Login"),
    path("register/", RegisterView.as_view(), name="Register"),
]
