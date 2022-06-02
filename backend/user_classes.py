import bcrypt
from sqlalchemy import FLOAT, INTEGER, VARCHAR, Column, Integer, MetaData, Table
from models.response.sign_in import Signin


class InstituteData: 
    from models.db.users.institute import Institute
    def __init__(self,engine):
        self.tableName = 'institute';
        self.meta = MetaData();
        self.engine= engine;
        self.create_table_in_db(self.engine);

    def validate_user(self, data: Signin):
        # Select query using username
        print("Validating user")
        #selecting where username is equal to the username in the data
        sel = self.table.select().where(self.table.c.username == data.username_or_email or self.table.c.email == data.username_or_email)
        result = self.engine.execute(sel)
        #fetching the result
        user = result.fetchone()
        #if the user is not found
        if user is None:
            return False
        # validating the password 
        if bcrypt.checkpw(data.password.encode('utf-8'), user.password.encode('utf-8')):
            return True
        # if the password is wrong
        return False
        
    
    def get_user_from_db(self, engine, username):
        # Select query using username
        print("Getting user from database")
        sel = self.table.select().where(self.table.c.username == username)
        result = self.engine.execute(sel)
        return result.fetchone()
    
    def create_user_in_db(self, data: Institute):
        # Insert query using Institute data class
        print("Creating user in database")
        ins = self.table.insert().values(
            username=data.username,
            password= bcrypt.hashpw((data.password).encode('utf-8'), bcrypt.gensalt()).decode('utf-8'),
            institutes_name=data.institutes_name,
            email=data.email,
            contact=data.contact,
            state=data.state,
            city=data.city,
            pincode=data.pincode,
            area=data.area,
            subscription_id=data.subscription_id
        )
        self.engine.execute(ins)
    

    def create_table_in_db(self,engine):
        print("Creating table in database")
        # Create table query
        self.table = Table(
            self.tableName,
            self.meta,
            Column('id', Integer, primary_key=True),
            Column('username', VARCHAR),
            Column('password', VARCHAR),
            Column('institutes_name', VARCHAR),
            Column('email', VARCHAR),
            Column('contact', VARCHAR),
            Column('state', VARCHAR),
            Column('city', VARCHAR),
            Column('pincode', VARCHAR),
            Column('area', VARCHAR),
            Column('subscription_id', VARCHAR)
        )
        self.meta.create_all(engine)
   


class StudentData:
    from models.db.users.students import Students
    def __init__(self,engine):
        self.tableName = 'institute';
        self.meta = MetaData();
        self.engine= engine;
        self.create_table_in_db(self.engine);

    def create_table_in_db(self,engine):
        self.table = Table(
            self.tableName,
            self.meta,
            Column('id', Integer, primary_key=True),
            Column("institute_id", INTEGER),
            Column("age", Integer),
            Column("course_id", Integer),
            Column("contact", Integer),
            Column("gender", VARCHAR),
            Column("address", VARCHAR),
            Column("parent_contact", Integer),
            Column("pending_fees", FLOAT),
            Column("total_fees", FLOAT),
            Column("username", VARCHAR),
            Column("institute_code", Integer),
            Column("name", VARCHAR),
            Column("password", VARCHAR),
        )
        self.meta.create_all(engine)


    def create_user_in_db(self, engine, data: Students):
        # Insert query using Students data class
        print("Creating user in database")
        ins = self.table.insert().values(
            institute_id=data.institute_id,
            course_id = data.course_id,
            age = data.age,
            gender = data.gender,
            contact = data.contact,
            parent_contact = data.parent_contact,
            address = data.address,
            total_fees = data.total_fees,
            pending_fees = data.pending_fees,
            institute_code = data.institute_code,
            username = data.username,
            password = bcrypt.hashpw((data.password).encode('utf-8'), bcrypt.gensalt()).decode('utf-8'),
            name = data.name,
        )
        self.engine.execute(ins);

    def validate_user(self, data:Signin):
        # Select query using username
        print("Validating user")
        #selecting where username is equal to the username in the data
        sel = self.table.select().where(self.table.c.username == data.username_or_email or self.table.c.email == data.username_or_email)
        result = self.engine.execute(sel)
        #fetching the result
        user = result.fetchone()
        #if the user is not found
        if user is None:
            return False
        # validating the password 
        if bcrypt.checkpw(data.password.encode('utf-8'), user.password.encode('utf-8')):
            return True
        # if the password is wrong
        return False

        
        


class TeacherData:
    from models.db.users.teacher import Teachers  

    def __init__(self,engine):
        self.tableName = 'institute';
        self.meta = MetaData();
        self.engine= engine;
        self.create_table_in_db();

    def create_table_in_db(self):   
        self.table = Table(
            self.tableName,
            self.meta,
            Column('id', Integer, primary_key=True),
            Column("institute_id",  INTEGER),
            Column("qualification",  VARCHAR),
            Column("phonenumber",  INTEGER),
            Column("key_subject",  VARCHAR),
            Column("username",  VARCHAR),
            Column("email", VARCHAR),
            Column("password",  VARCHAR)
        )
        self.meta.create_all(self.engine)

    def validate_user(self, data:Signin):
        # Select query using Signin data class
        print("Validating user")
        #selecting where username is equal to the username in the data
        sel = self.table.select().where(self.table.c.username == data.username_or_email or self.table.c.email == data.username_or_email)
        result = self.engine.execute(sel)
        #fetching the result
        user = result.fetchone()
        #if the user is not found
        if user is None:
            return False
        # validating the password 
        if bcrypt.checkpw(data.password.encode('utf-8'), user.password.encode('utf-8')):
            return True
        # if the password is wrong
        return False



    def create_user_in_db(self, data: Teachers):
        # Insert query using Teachers data class
        print("Creating user in database")
        ins = self.table.insert().values(
            institute_id=data.institute_id,
            qualification=data.qualification,
            phonenumber=data.phonenumber,
            key_subject=data.key_subject,
            username=data.username,
            email=data.email,
            password=bcrypt.hashpw((data.password).encode('utf-8'), bcrypt.gensalt()).decode('utf-8'),
        )
        self.engine.execute(ins)



class ParentData:


    pass
