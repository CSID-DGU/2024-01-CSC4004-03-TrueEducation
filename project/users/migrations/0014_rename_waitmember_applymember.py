# Generated by Django 5.0.5 on 2024-06-05 20:58

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0013_rename_member_groupmember_waitmember'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='WaitMember',
            new_name='ApplyMember',
        ),
    ]
