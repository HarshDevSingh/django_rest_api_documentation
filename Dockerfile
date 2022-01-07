FROM python:3.8
ENV PYTHONUNBUFFERED 1

WORKDIR /core

COPY requirements.txt requirements.txt

COPY . .

RUN pip3 install -r requirements.txt