FROM cirrusci/flutter:latest

RUN sudo apt-get update \
    && sudo apt-get install -y \
    && sudo apt update \
    && sudo apt install -y python3 python3-pip \  
    && sudo apt update \
    && sudo apt install -y postgresql postgresql-client\
    && sudo pg_ctlcluster 12 main start 




