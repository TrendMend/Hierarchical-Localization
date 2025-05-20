FROM trendmend/colmap:latest
MAINTAINER Paul-Edouard Sarlin
ARG PYTHON_VERSION=3.8

# Prevent stop building ubuntu at time zone selection.
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y unzip wget software-properties-common git
RUN apt-get install -y python3 python3-pip
#RUN add-apt-repository ppa:deadsnakes/ppa && \
#    apt-get -y update && \
#    apt-get install -y python${PYTHON_VERSION}
#RUN wget https://bootstrap.pypa.io/pip/${PYTHON_VERSION}/get-pip.py && python${PYTHON_VERSION} get-pip.py
#RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python${PYTHON_VERSION} 1
COPY . /app
WORKDIR app/
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN pip3 install notebook
