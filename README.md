Hack for Clues
============

Scavenger hunt using open data.

Getting started
===============

1. Install and setup [pyenv](https://github.com/yyuu/pyenv) and [postgresql](https://www.postgresql.org/)
2. Run the following commands to set up your python environment:
```
pyenv install 3.5.2
pyenv virtualenv 3.5.2 hackforcluesenv
pyenv activate hackforcluesenv
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
