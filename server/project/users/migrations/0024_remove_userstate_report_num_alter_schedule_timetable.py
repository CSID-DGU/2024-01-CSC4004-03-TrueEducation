# Generated by Django 5.0.5 on 2024-06-11 16:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0023_userstate_id_alter_userstate_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userstate',
            name='report_num',
        ),
        migrations.AlterField(
            model_name='schedule',
            name='timetable',
            field=models.TextField(default=0),
        ),
    ]
