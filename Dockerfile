FROM python:3.8
ENV PYTHONUNBUFFERED 1

WORKDIR /core

USER root

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

USER app