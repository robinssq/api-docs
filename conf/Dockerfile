# match python version on Read the Docs
FROM python:3.5-alpine

RUN apk update && apk add make

WORKDIR /opt/bamx

ADD requirements.txt /opt/bamx/conf/requirements.txt
RUN pip install -r /opt/bamx/conf/requirements.txt
