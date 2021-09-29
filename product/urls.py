from django.conf import settings
from django.urls import path
from django.conf.urls.static import static

from .views import IndexView, product_by_category,  product_detail_view

app_name = 'product'

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    # path('detail/<int:pk>/', DetailView.as_view(), name='detail'),
    path('detail/<int:product_id>/', product_detail_view, name='detail'),
    path('categories/<str:category>/', product_by_category, name='product_by_category'),

]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

