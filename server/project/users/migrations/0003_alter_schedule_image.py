# Generated by Django 5.0.5 on 2024-05-28 20:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_schedule_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='schedule',
            name='image',
            field=models.ImageField(upload_to='img/'),
        ),
    ]
