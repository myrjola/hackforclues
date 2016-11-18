jsondumpster
============

Least effort platform to dump sensor data from the 5G bike to a cloud service.

Getting started
===============

1. Install and setup [pyenv](https://github.com/yyuu/pyenv) and [postgresql](https://www.postgresql.org/)
2. Run the following commands to set up your python environment:
```
pyenv install 3.5.2
pyenv virtualenv 3.5.2 jsondumpsterenv
pyenv activate jsondumpsterenv
```
3. Now download the dependencies
```
pip install -r requirements.txt
```
4. Run the migrations and start the service
```
python manage.py migrate
python manage.py runserver
```
5. Upload data to the service by posting JSON to http://localhost:8000/api/v1/sensordata
