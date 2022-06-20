#!/bin/sh

python manage.py makemigrations
python manage.py migrate

echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'example@example.com','111111')" | python manage.py shell

python manage.py runserver 0.0.0.0:8000

$@
