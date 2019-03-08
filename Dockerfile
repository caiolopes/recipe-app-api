FROM python:3.7-alpine
MAINTAINER Caio Lopes

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt && adduser -D user # -D => Don't assign a password

COPY ./app /app

WORKDIR /app
USER user
