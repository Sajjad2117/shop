from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import logout_view, login_page, register_page, update_customer

app_name = 'customer'

urlpatterns = [
    path('profile/', update_customer, name='profile'),
    path('login/', login_page, name='login'),
    path('logout/', logout_view, name='logout'),
    path('register/', register_page, name='register'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
