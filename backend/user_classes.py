import bcrypt
from sqlalchemy import FLOAT, INTEGER, VARCHAR, Column, Integer, MetaData, Table 
from models.response.sign_in import Signin
from fastapi import HTTPException

class InstituteData: 
    from models.db.users.institute import Institute
    def __init__(self,engine):
        self.tableName = 'institute';
        self.meta = MetaData();
        self.engine= engine;
        self.create_table_in_db(self.engine);

    

    def validate_user(self, data: Signin):
        # Select query using username
        print(f"Validating user Data username {data.username_or_email} password {data.password}")
        #selecting where username is equal to the username in the data
        sel = self.table.select().where(self.table.c.username == data.username_or_email)
        sel2 = self.table.select().where(self.table.c.email == data.username_or_email)

        result = self.engine.execute(sel)
        result1 = self.engine.execute(sel2)
        #fetching the result
        user = result.fetchone()
        user1 = result1.fetchone()
        print(f"user {user}, user1 {user1}")
        if user is None or user1 is None:
            user = max(user, user1, key=lambda x: x != None)  
        if user is None:
            return False
        if bcrypt.checkpw(data.password.encode('utf-8'), user.password.encode('utf-8')):
            return True
        else:
            return False
       
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
        return "User created successfully" 

    def drop_all_tables(self):
        print("Dropping all tables")
        self.meta.drop_all(self.engine)
    

    def create_table_in_db(self,engine):
        print("Creating table in database")
        # Create table query
        self.table = Table(
            self.tableName,
            self.meta,
            Column('id', Integer, primary_key=True),
            Column('username', VARCHAR,unique= True),
            Column('password', VARCHAR),
            Column('institutes_name', VARCHAR),
            Column('email', VARCHAR,unique= True),
            Column('contact', VARCHAR),
            Column('state', VARCHAR),
            Column('city', VARCHAR),
            Column('pincode', VARCHAR),
            Column('area', VARCHAR),
            Column('subscription_id', VARCHAR)
        )
        self.meta.create_all(engine)

    def get_user_by_username(self, username:str):
        print(f"Getting user by username {username}")
        # Select query using username
        print(f"Validating user Data username {username}")
        #selecting where username is equal to the username in the data
        sel = self.table.select().where(self.table.c.username == username)
        sel2 = self.table.select().where(self.table.c.email == username)

        result = self.engine.execute(sel)
        result1 = self.engine.execute(sel2)
        #fetching the result
        user = result.fetchone()
        user1 = result1.fetchone()
        print(f"user {user}, user1 {user1}")
        if user is None or user1 is None:
            user = max(user, user1, key=lambda x: x != None)  
        if user is None:
            return "User not found"
        return user
   


class StudentData:
    from models.db.users.students import Students
    def __init__(self,engine):
        self.tableName = 'students';
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
            Column("contact", VARCHAR),
            Column("gender", VARCHAR),
            Column("address", VARCHAR),
            Column("parent_contact", VARCHAR),
            Column("pending_fees", FLOAT),
            Column("total_fees", FLOAT),
            Column("email", VARCHAR,unique= True),
            Column("username", VARCHAR,unique= True),
            Column("institute_code", Integer),
            Column("name", VARCHAR),
            Column("password", VARCHAR),
        )
        self.meta.create_all(engine)
    def drop_all_tables(self):
        print("Dropping all tables")
        self.meta.drop_all(self.engine)

    def create_user_in_db(self,  data: Students):
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
            email = data.email,
            password = bcrypt.hashpw((data.password).encode('utf-8'), bcrypt.gensalt()).decode('utf-8'),
            name = data.name,
        )
        self.engine.execute(ins);
        return True

    def validate_user(self, data:Signin):
        # Select query using username
        print(f"Validating user Data username {data.username_or_email} password {data.password}")
        #selecting where username is equal to the username in the data
        sel = self.table.select().where(self.table.c.username == data.username_or_email)
        sel2 = self.table.select().where(self.table.c.email == data.username_or_email)

        result = self.engine.execute(sel)
        result1 = self.engine.execute(sel2)
        #fetching the result
        user = result.fetchone()
        user1 = result1.fetchone()
        print(f"user {user}, user1 {user1}")
        if user is None or user1 is None:
            user = max(user, user1, key=lambda x: x != None)  
        if user is None:
            return False
        if bcrypt.checkpw(data.password.encode('utf-8'), user.password.encode('utf-8')):
            return True
        else:
            return False

    def get_user_by_username(self, username:str):
        print(f"Getting user by username {username}")
        # Select query using username
        print(f"Validating user Data username {username}")
        #selecting where username is equal to the username in the data
        sel = self.table.select().where(self.table.c.username == username)
        sel2 = self.table.select().where(self.table.c.email == username)

        result = self.engine.execute(sel)
        result1 = self.engine.execute(sel2)
        #fetching the result
        user = result.fetchone()
        user1 = result1.fetchone()
        print(f"user {user}, user1 {user1}")
        if user is None or user1 is None:
            user = max(user, user1, key=lambda x: x != None)  
        if user is None:
            return "User not found"

        return user
        
        


class TeacherData:
    from models.db.users.teacher import Teachers  

    def __init__(self,engine):
        self.tableName = 'teachers';
        self.id_tableName = 'teacher_id';
        self.meta = MetaData();
        self.engine= engine;
        self.create_table_in_db();

    
    

    def create_table_in_db(self):   
        self.table = Table(
            self.tableName,
            self.meta,
            Column('id', Integer, primary_key=True),
            Column("qualification",  VARCHAR),
            Column("phonenumber",  VARCHAR),
            Column("key_subject",  VARCHAR),
            Column("username",  VARCHAR,unique= True),
            Column("email", VARCHAR,unique= True),
            Column("password",  VARCHAR)
        )

        self.idtable = Table(
            self.id_tableName,
            self.meta,
            Column('id', Integer, primary_key=True),
            Column("teacher_id",  Integer),
            Column("institute_id",  Integer),
        )

        self.meta.create_all(self.engine)


    def drop_all_tables(self):
        print("Dropping all tables")
        self.meta.drop_all(self.engine)


    def validate_user(self, data:Signin):
        print(f"Validating user Data username {data.username_or_email} password {data.password}")
        #selecting where username is equal to the username in the data
        sel = self.table.select().where(self.table.c.username == data.username_or_email)
        sel2 = self.table.select().where(self.table.c.email == data.username_or_email)

        result = self.engine.execute(sel)
        result1 = self.engine.execute(sel2)
        #fetching the result
        user = result.fetchone()
        user1 = result1.fetchone()
        print(f"user {user}, user1 {user1}")
        if user is None or user1 is None:
            user = max(user, user1, key=lambda x: x != None)  
        if user is None:
            return False
        if bcrypt.checkpw(data.password.encode('utf-8'), user.password.encode('utf-8')):
            return True
        else:
            return False

    def get_user_by_username(self, username:str):
        print(f"Getting user by username {username}")
        # Select query using username
        print(f"Validating user Data username {username}")
        #selecting where username is equal to the username in the data
        sel = self.table.select().where(self.table.c.username == username)
        sel2 = self.table.select().where(self.table.c.email == username)

        result = self.engine.execute(sel)
        result1 = self.engine.execute(sel2)
        #fetching the result
        user = result.fetchone()
        user1 = result1.fetchone()
        print(f"user {user}, user1 {user1}")
        if user is None or user1 is None:
            user = max(user, user1, key=lambda x: x != None)  
        if user is None:
            return "User not found"

        return user

    def get_details_using_id(self, id:int):
        print(f"Getting user by id {id}")
        # Select query using username
        print(f"Validating user Data username {id}")
        #selecting where username is equal to the username in the data
        sel = self.table.select().where(self.table.c.id == id)
        result = self.engine.execute(sel)
        #fetching the result
        user = result.fetchone()
        if user is None:
            return "User not found"

        return user

    def join_institute_as_teacher( self, teacher_id:int, institute_id:int):
        print(f"Joining institute as teacher {teacher_id} {institute_id}")
        ins = self.idtable.select().where(self.idtable.c.teacher_id == teacher_id)
        haikya =  self.engine.execute(ins);
        if haikya.rowcount == 0:
            ins = self.idtable.insert().values(teacher_id=teacher_id, institute_id=institute_id)
            self.engine.execute(ins);
            return "joined institute"
        else: 
            return "already joined institute"

    def get_all_teachers_in_institute(self,institute_id):
        # join table with teacher_id and institute_id
        sel = self.idtable.select().where(self.idtable.c.institute_id == institute_id)
        result = self.engine.execute(sel)
        teachers = result.fetchall()
        print(f"teachers {teachers}")
        
        return [self.get_details_using_id(x['teacher_id']) for x in teachers]

    def create_user_in_db(self, data: Teachers):
        # Insert query using Teachers data class
        try:
            print("Creating user in database")
            ins = self.table.insert().values(
                qualification=data.qualification,
                phonenumber=data.phonenumber,
                key_subject=data.key_subject,
                username=data.username,
                email=data.email,
                password=bcrypt.hashpw((data.password).encode('utf-8'), bcrypt.gensalt()).decode('utf-8'),
            )
            self.engine.execute(ins)
            return True
        except:
            raise HTTPException(status_code=400, detail="User already exists")



class ParentData:


    pass
