# Generated by Django 5.0.5 on 2024-06-05 23:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0015_groupmember_state_delete_applymember'),
    ]

    operations = [
        migrations.AlterField(
            model_name='groupmember',
            name='state',
            field=models.PositiveSmallIntegerField(blank=True, default=1, null=True),
        ),
    ]
