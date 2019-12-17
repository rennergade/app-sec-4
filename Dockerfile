FROM python:3.7.1

LABEL Author="Nicholas Renner"
LABEL E-mail="nrenner@dummy.edu"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

RUN rm -f spell.db

RUN python dbsetup.py

CMD flask run --host=0.0.0.0 --port=8080


