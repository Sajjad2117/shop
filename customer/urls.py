from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import logout_view, RegisterView, LoginUserView, edit_profile_view

app_name = 'customer'

urlpatterns = [
    path('login/', LoginUserView.as_view(), name='login'),
    path('register/', RegisterView.as_view(), name='register'),
    path('logout/', logout_view, name='logout'),
    # path('profile/', update_customer, name='profile'),
    path('edit-profile/', edit_profile_view, name="edit_profile"),

]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
