FROM ubuntu:18.04

USER gitpod

RUN sudo su 

RUN apt update -y && apt upgrade -y  && apt install -y mysql-server

RUN apt install -y python3 python3-pip

RUN pip3 install fastapi uvicorn  