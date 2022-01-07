FROM python:3.9
ENV PYTHONUNBUFFERED 1

WORKDIR /core

USER root

COPY requirements.txt requirements.txt
COPY . .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    adduser --disabled-password --no-create-home core

USER core