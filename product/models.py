from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models
from django.utils.translation import gettext_lazy as _


class Category(models.Model):
    name = models.CharField(max_length=200, unique=True)
    # parent = models.ForeignKey("self", on_delete=models.CASCADE, null=True, blank=True, verbose_name=_('parent'),
    #                            related_name='children')

    class Meta:
        ordering = ('name',)
        verbose_name = _("Category")
        verbose_name_plural = _("Categories")

    def __str__(self):
        return self.name


class Product(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, verbose_name=_('category'),
                                 related_name='products')
    name = models.CharField(max_length=200)
    description = models.TextField(max_length=1000, default="About product")
    price = models.DecimalField(max_digits=8, decimal_places=2)
    image = models.ImageField(upload_to='product', null=True, blank=True)
    number = models.PositiveIntegerField(blank=True, null=True, default=0)
    date_added = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(default=True)             ######## property ### is_exist

    class Meta:
        ordering = ('-date_added',)
        verbose_name = 'Product'
        verbose_name_plural = 'Products'

    def __str__(self):
        return f'{self.name}'


# class ProductDiscount(models.Model):
#     products = models.ManyToManyField(Product, related_name='discounts')
#     amount = models.PositiveSmallIntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(100)])
#
#     class Meta:
#         verbose_name = 'Product discount'
#         verbose_name_plural = 'Product discounts'
#
#     def __str__(self):
#         return f'{self.amount}%'
