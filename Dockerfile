FROM python:3.7-alpine
MAINTAINER Caio Lopes

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client \
        && apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev \
        && pip install -r /requirements.txt \
        && apk del .tmp-build-deps

COPY ./app /app

WORKDIR /app

RUN adduser -D user # -D => Don't assign a password
USER user
