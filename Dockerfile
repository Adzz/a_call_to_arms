FROM arm32v7/ubuntu

RUN apt-get update && apt-get -y install gcc vim

WORKDIR /assembly

COPY ./output/ ./assembly/

