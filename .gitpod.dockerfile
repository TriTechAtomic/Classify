FROM ubuntu/mysql

RUN sudo su 

RUN apt install -y python3 python3-pip 

RUN pip3 install fastapi uvicorn sqlalchemy