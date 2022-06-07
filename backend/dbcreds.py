from models.db.users.institute import Institute
from models.db.users.students import Students
from models.db.users.teacher import Teachers


from sqlalchemy import create_engine
from models.response.sign_in import Signin

from user_classes import InstituteData, StudentData, TeacherData




class DbController:
    def __init__(self):
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
        
        #creating the instances of the classes    
        self.teacher = TeacherData(engine=self.connection)
        self.institute = InstituteData(engine=self.connection)
        self.student = StudentData(engine=self.connection)

    # Student functions
    def create_student(self, data: Students):
        return self.student.create_user_in_db(data=data)
    # check password 
    def validate_student(self, data: Signin):
        return self.student.validate_user(data)



    # Teacher functions
    def create_teacher(self,Teacher:Teachers):
        return self.teacher.create_user_in_db(Teacher)
    # check password 
    def validate_teacher(self, data: Signin):
        return self.teacher.validate_user(data)

    

    # Institute functions
    def create_institute(self, data: Institute):
        return self.institute.create_user_in_db(data)
    # check password 
    def validate_institute_creds(self, data: Signin ):
        return self.institute.validate_user(data)
    


        
    
        
