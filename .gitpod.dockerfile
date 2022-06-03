FROM cirrusci/flutter:latest

RUN sudo apt-get update \
    && sudo apt-get install -y \
    && sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
    &&  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
    &&  sudo apt-get update\
    &&  sudo apt-get -y install postgresql\
    && sudo apt install -y python3 python3-pip \
    && pip3 install fastapi uvicorn sqlalchemy 

