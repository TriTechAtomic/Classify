from datetime import datetime
from typing import List

from fastapi import HTTPException
from models.db.admin.courses import Courses
from models.db.features.subjects import Subject
from models.db.users.institute import Institute
from models.db.users.students import Students
from models.db.users.teacher import Teachers


from sqlalchemy import Column, DateTime, create_engine
from models.response.sign_in import Signin

from user_classes import InstituteData, StudentData, TeacherData




class DbController:
    def __init__(self):
        # Database credentials create connection
        
        self.engine= create_engine(
            url="postgresql://uaiufttmambwmd:996f587ac6d450109d1456aa5f2a3c7f645a9416214512f6dcaef2cbe5dbdbd6@ec2-3-248-121-12.eu-west-1.compute.amazonaws.com:5432/d16tgau69sk67n",
            echo=True
        )
        self.connection = self.engine.connect()
        
        #creating the instances of the classes    
        self.teacher = TeacherData(engine=self.connection)
        self.institute = InstituteData(engine=self.connection)
        self.student = StudentData(engine=self.connection)




    #commons 
    
    # get userdetails with username and role 

    # username aur role se userdetails return kar raha hai
    def get_user_details(self, username: str,role:str):
        if role == "institute":
            data =  self.institute.get_user_by_username(username)
            print(data)
            return data
        elif role == "teacher":
            data =  self.teacher.get_user_by_username(username)
            print(data)
            return data
        elif role == "student":
            data =  self.student.get_user_by_username(username)
            print(data)
            return data
        else: 
            return {"message": ">> You are not authorized to access this route"}
        

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
        
   
    # get teacter with keysubjects
    def get_teacher_with_keysubjects(self, teacher_id: int):
        return self.teacher.get_teacher_with_keysubjects(teacher_id)
    

    # institute ka sub teacher
    def get_all_teachers_in_institute(self,institute_id):
        return self.teacher.get_all_teachers_in_institute(institute_id)
    
    def get_teacher_with_email(self, email: str):
        return self.teacher.get_teacher_with_email(email)

    # teacher ka sub institute
    def get_all_teachers_institute(self,teacher_id): 
        return self.teacher.get_all_teachers_institute(teacher_id)

    # teacher join kar raha hai institute  
    def join_institute_as_teacher(self, teacher_id: int, institute_id: int):
        return self.teacher.join_institute_as_teacher(teacher_id=teacher_id, institute_id=institute_id )

    
    

    # Institute functions
    # institute bana raha hai
    def create_institute(self, data: Institute):
        return self.institute.create_user_in_db(data)
    
    # check password 
    # bhai ka details check kar raha hai
    def validate_institute_creds(self, data: Signin ):
        return self.institute.validate_user(data)

    # create course in institute
    def create_course(self,data: Courses, institute_id: int, SubjectsDetails: List[Subject] ):
        # valdiate all the teacher id is valid or not
        all_the_teachers_in_institute =  self.get_all_teachers_in_institute(institute_id)
        for subject in SubjectsDetails:
            if subject.teacher_id not in all_the_teachers_in_institute :
                raise HTTPException(400,"Teacher id is not valid / trying to add teachers that dont extist in the institute")
        return self.institute.create_cource(data, institute_id, SubjectsDetails)

    # get all courses in institute
    def get_all_courses_in_institute(self, institute_id: int):
        return self.institute.get_all_courses_in_institute(institute_id)

    # get all subjects in course
    def get_all_subjects_in_course(self, course_id: int):
        return self.institute.get_all_subjects_in_course(course_id)
    

    # dont call this deletes the complete startup database
    def drop_all_tables(self):
        self.institute.drop_all_tables()
        self.student.drop_all_tables()
        self.teacher.drop_all_tables()

        