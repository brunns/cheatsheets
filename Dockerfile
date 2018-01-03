FROM ubuntu:16.04
MAINTAINER Simon Brunning "simon@brunni.ng"
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential pandoc graphviz texlive-xetex libreoffice-base libreoffice -y --no-install-recommends
ADD . /app
WORKDIR /app
RUN make all
