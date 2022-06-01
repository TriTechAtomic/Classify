from pydantic import parse_obj_as
from sqlalchemy import FLOAT, VARCHAR, Table, Column, Integer, String, MetaData

class Institute: 
    def create_table_in_db(self,engine):
       
        meta = MetaData()  
        AdminSmt = Table(
            '', meta,
            Column('username', Integer, primary_key=True),
            Column('password', String(50), unique=True),
            Column('institutes_name', String(100)),
            Column('email', String(120), unique=True),
            Column('contact', Integer),
            Column('state', String(120)),
            Column('city', String(120)),
            Column('pincode', String(120)),
            Column('area', Integer),
            Column('subscription_id', String(120)),
        )
        meta.create_all(engine)
    

class Student:
    
   def create_table_in_db(self,engine):

        meta = MetaData()  
        studentSmt = Table(
            'student', meta,
Column("id",Integer,primary_key=True),
Column("institute_id",Integer),
Column("course_id",Integer),
Column("age",Integer),
Column("gender",VARCHAR),
Column("contact",Integer),
Column("parent_contact",Integer),
Column("address",VARCHAR),
Column("total_fees",FLOAT),
Column("pending_fees",FLOAT),
Column("institute_code",Integer),
Column("username",VARCHAR),
Column("password",VARCHAR),
Column("name",VARCHAR),
            
        )
        meta.create_all(engine)

class Teacher:
    pass

class parent:
    pass
