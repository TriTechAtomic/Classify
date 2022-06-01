from models.db.users.teacher import Teachers
from models.response.sign_up import Signup
from sqlalchemy import insert
from sqlalchemy.dialects.postgresql import insert
from sqlalchemy import create_engine
import jwt




class DbController:
    
    def _create_users_table(self):
        from sqlalchemy import Table, Column, Integer, String, MetaData
        meta = MetaData()  

        users = Table(
            'users', meta,
            Column('id', Integer, primary_key=True),
            Column('username', String(50), unique=True),
            Column('password', String(100)),
            Column('email', String(120), unique=True),
            Column('phonenumber', Integer),
            Column('address', String(120)),
            Column('city', String(120)),
            Column('state', String(120)),
            Column('zipcode', Integer),
            Column('country', String(120)),
            Column('role', String(120)),
        )
        meta.create_all(self.engine)

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
        # ins = insert(self.users).values(
        #     username=,
        #     password=,
        #     email=
        
        
        
        
        


       

    




        

        
s = DbController().create_user()