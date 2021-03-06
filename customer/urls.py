from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import logout_view, RegisterView, edit_profile_view, login_view, profile_view, ChangePasswordView

app_name = 'customer'

urlpatterns = [
    # path('login/', LoginUserView.as_view(), name='login'),
    path('login/', login_view, name='login'),
    path('register/', RegisterView.as_view(), name='register'),
    path('logout/', logout_view, name='logout'),
    path('profile/', profile_view, name='profile'),
    path('edit-profile/', edit_profile_view, name="edit_profile"),
    path('change-password/', ChangePasswordView.as_view(), name='change_password'),


]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
