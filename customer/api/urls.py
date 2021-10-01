from django.urls import path

from .views import RegisterAPIView, ChangePasswordView

app_name = "customer"

urlpatterns = [
    # ex: api/user/login/
    # path("login/", views.LoginView.as_view(), name="Login"),
    # # ex: api/user/register/
    # path("register/", views.RegisterView.as_view(), name="Register"),

    # path("login/", UserLoginAPIView.as_view(), name="Login"),
    path("register/", RegisterAPIView.as_view(), name="Register"),
    path('change-password/', ChangePasswordView.as_view(), name='change_password_api'),
]
