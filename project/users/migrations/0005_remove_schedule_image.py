# Generated by Django 5.0.5 on 2024-05-30 15:37

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_alter_schedule_image'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='schedule',
            name='image',
        ),
    ]
