from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import logout_view, login_page, register_page

app_name = 'customer'

urlpatterns = [
    # path('profile/', views.update_customer, name='customer_profile'),
    path('login/', login_page, name='login'),
    path('logout/', logout_view, name='logout'),
    path('register/', register_page, name='register'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
