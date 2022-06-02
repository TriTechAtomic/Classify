from models.db.users.institute import Institute
from models.db.users.teacher import Teachers
from models.response.sign_up import Signup
from sqlalchemy import insert
from sqlalchemy.dialects.postgresql import insert
from sqlalchemy import create_engine
import jwt

from user_classes import InstituteData, StudentData, TeacherData




class DbController:
    def __init__(self):
        #creating the instances of the classes
        self.teacher = TeacherData()
        self.institute = InstituteData()
        self.student = StudentData()
        
    
        # Database credentials 
        conData  = {
        "user"     : "postgres",
        "password" : "123",
        "host"     : "localhost",
        "port"     : 5432,
        "database" : "classify",
        }

        self.engine= create_engine(
            url="postgresql://{0}:{1}@{2}:{3}/{4}".format(
                conData["user"],
                conData["password"],
                conData["host"],
                conData["port"], 
                conData["database"]
            ),
            echo=True
        )
        self.connection = self.engine.connect()
        

    def create_teacher(self,Teacher:Teachers,):
        self.teacher.create_table_in_db(self.connection)
        self.teacher.create_user_in_db(self.connection, Teacher)
    
    def create_institute(self, data: Institute):
        self.institute.create_table_in_db(self.connection)
        self.institute.create_user_in_db(self.connection, data)
        

        
    
        
