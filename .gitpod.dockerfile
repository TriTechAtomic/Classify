FROM cirrusci/flutter:latest

RUN sudo apt-get update \
    && sudo apt-get install -y \
    && sudo apt-get install -y mysql-server \
    && sudo apt install -y python3 python3-pip \
    && pip3 install fastapi uvicorn sqlalchemy 

