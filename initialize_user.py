import airflow
from airflow import models, settings
from airflow.contrib.auth.backends.password_auth import PasswordUser


user = PasswordUser(models.User())
user.username = 'admin'
user.email = 'admin@example.com'
user.password = 'password'
session = settings.Session()
session.add(user)
session.commit()
session.close()
