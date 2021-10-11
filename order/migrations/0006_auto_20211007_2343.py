# Generated by Django 3.2.7 on 2021-10-07 20:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0005_order_total_price'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='orderitem',
            name='product',
        ),
        migrations.AddField(
            model_name='orderitem',
            name='product',
            field=models.CharField(default='null', max_length=200),
            preserve_default=False,
        ),
    ]
