FROM ubuntu/mysql

USER root

# update repos
RUN apt-get update && apt-get install -y mysql-server && apt-get clean 

# installing python dependencies
RUN apt install -y python3 python3-pip && pip3 install fastapi &&  pip3 install uvicorn && pip3 install sqlalchemy