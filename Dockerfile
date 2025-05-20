FROM trendmend/colmap:latest
MAINTAINER Paul-Edouard Sarlin

# Prevent stop building ubuntu at time zone selection.
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y python3 python3-pip git
RUN pip3 install --upgrade pip

COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt
RUN pip3 install notebook
COPY . /app
