from models.db.users.teacher import Teachers
from models.response.sign_up import Signup
from sqlalchemy import insert
from sqlalchemy.dialects.postgresql import insert
from sqlalchemy import create_engine
import jwt




class DbController:
    
   

    def __init__(self):
        # Database credentials 
        conData  = {
        "host"     : "localhost",
        "port"     : 5432,
        "user"     : "postgres",
        "password" : "123",
        "database" : "jwt_auth_example",
        }

        self.engine = create_engine(
            url="postgresql://{0}:{1}@{2}:{3}/{4}".format(
                conData["user"],
                conData["password"],
                conData["host"],
                conData["port"], 
                conData["database"]
            ),
            echo=True
        )
        

    def create_teacher(self,Teacher:Teachers):
        self._create_users_table()
        ins = insert("teacher").values(id=Teacher.id,
            institute_id=Teacher.institute_id,
            qualification=Teacher.qualification,
            key_subject=Teacher.key_subject,
            username=Teacher.username,
            email=Teacher.email,
            password=Teacher.password,
           
        )
        
        
        
        
        


       

    




        

        
s = DbController().create_user()