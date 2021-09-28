from django.shortcuts import render, get_object_or_404
from django.views import generic

from .models import Product, Category


class IndexView(generic.ListView):
    model = Product
    queryset = Product.objects.filter(is_active=True).order_by('-date_added')[:9]
    template_name = 'product/index.html'
    context_object_name = 'products'

    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        context['categories'] = Category.objects.all()
        return context


class DetailView(generic.DetailView):
    model = Product
    template_name = 'product/detail.html'
    context_object_name = 'products'


def product_by_category(request, category):
    context = dict()
    category_id = Category.objects.get(name=category).id
    categories = Category.objects.all()
    product_list = Product.objects.filter(category=category_id, is_active=True)
    context['products'] = product_list
    context['categories'] = categories
    return render(request, 'product/product_category.html', context=context)
