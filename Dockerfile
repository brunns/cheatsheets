FROM ubuntu:latest
MAINTAINER Simon Brunning "simon@brunni.ng"
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential pandoc graphviz openjdk-8-jdk libreoffice-base libreoffice -y --no-install-recommends
ADD . /app
WORKDIR /app
RUN make all
