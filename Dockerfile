FROM python:3.10.8-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt
EXPOSE 8080

RUN cd /
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /Post-Search-Bot
WORKDIR /Post-Search-Bot
COPY . /Post-Search-Bot
CMD gunicorn app:app & python3 main.py
