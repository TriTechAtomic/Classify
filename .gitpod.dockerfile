FROM ubuntu/mysql

USER root

# update repos
RUN apt-get update -y apt-get install 

# installing python dependencies
RUN apt install -y python3 python3-pip && pip3 install fastapi &&  pip3 install uvicorn && pip3 install sqlalchemy