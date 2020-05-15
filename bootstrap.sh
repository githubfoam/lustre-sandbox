#!/bin/bash

# https://github.com/ComplianceAsCode/demo#Install-the-test-VM
dnf install git python -y
python -V
git clone https://github.com/ComplianceAsCode/demo.git
git clone https://github.com/ComplianceAsCode/content.git
ls -lai
cd content
cd tests
ls -lai
#install_vm.py ./install_vm.py --distro fedora --domain test-suite-fedora
python install_vm.py --domain test-suite-fedora --distro fedora

# apt-get update
# apt-get install -y python3-dev python3-pip
# apt-get install -y postgresql libpq-dev
# pip3 install virtualenv
#
# # Initialize Airflow Database
# su postgres <<'EOF'
#   createuser -s -w airflow
#   createdb airflow -O airflow
#   psql -c "ALTER USER "airflow" WITH PASSWORD 'airflow';"
# EOF
#
# # Airflow Installation: https://airflow.incubator.apache.org/start.html
# su ubuntu <<'EOF'
#   echo 'export AIRFLOW_HOME=~/airflow' >> /home/ubuntu/.bash_profile
#   echo 'export AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://airflow:airflow@localhost:5432/airflow' >> /home/ubuntu/.bash_profile
#   source /home/ubuntu/.bash_profile
#   virtualenv /home/ubuntu/venv
#   source /home/ubuntu/venv/bin/activate
#   pip install "airflow[postgres, password, slack]"
#   airflow initdb
#   python /vagrant/initialize_user.py
# EOF
