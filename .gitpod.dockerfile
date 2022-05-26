FROM ubuntu/mysql

USER gitpod

# update repos
RUN sudo apt-get update -y && sudo apt-get upgrade -y

# installing python dependencies
RUN sudo apt install -y python3 python3-pip && sudo  pip3 install fastapi && sudo pip3 install uvicorn && sudo  pip3 install sqlalchemy 