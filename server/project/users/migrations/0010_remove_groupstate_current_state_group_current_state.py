# Generated by Django 5.0.5 on 2024-06-05 17:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0009_alter_group_leader'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='groupstate',
            name='current_state',
        ),
        migrations.AddField(
            model_name='group',
            name='current_state',
            field=models.PositiveSmallIntegerField(default=0),
        ),
    ]
