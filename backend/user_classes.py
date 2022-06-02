

import bcrypt
from sqlalchemy import VARCHAR, Column, Integer, MetaData, Table


class InstituteData: 
    from models.db.users.institute import Institute
    def __init__(self):
        self.tableName = 'institute';
        self.meta = MetaData();

        


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
        


        
    
    def create_user_in_db(self, engine, data: Institute):
        # Insert query using Institute data class
        print("Creating user in database")
        ins = self.table.insert().values(
            username=data.username,
            password= bcrypt.hashpw((data.password).encode('utf-8'), bcrypt.gensalt()),
            institutes_name=data.institutes_name,
            email=data.email,
            contact=data.contact,
            state=data.state,
            city=data.city,
            pincode=data.pincode,
            area=data.area,
            subscription_id=data.subscription_id
        )
        engine.execute(ins)
    


class StudentData:
    from models.db.users.students import Students
    def create_table_in_db(self,engine):
        engine.execute(
            """
            CREATE TABLE IF NOT EXISTS student (
                id SERIAL PRIMARY KEY,
                institute_id INTEGER NOT NULL,
                course_id Integer NOT NULL
                age Integer NOT NULL,
                gender VARCHAR NOT NULL,
                contact Integer NOT NULL,
                parent_contact Integer NOT NULL,
                address VARCHAR NOT NULL,
                total_fees FLOAT NOT NULL,
                pending_fees FLOAT NOT NULL,
                institute_code Integer NOT NULL,
                username VARCHAR NOT NULL,
                password VARCHAR NOT NULL,
                name VARCHAR NOT NULL);
            """)

    def create_user_in_db(self, engine, data: Students):
        # Insert query using Students data class
        engine.execute('''
            INSERT INTO student (
                institute_id,
                course_id,
                age,
                gender
                contact
                parent_contact
                address
                total_fees
                pending_fees
                institute_code
                username
                password
                name)
            VALUES (
                '{0}',
                '{1}',
                '{2}',
                '{3}',
                '{4}',
                '{5}',
                '{6}',
                '{7}',
                '{8}',
                '{9}',
                '{10}',
                '{11}'
            );
        '''.format(
            data.institute_id,
            data.course_id,
            data.age,
            data.gender,
            data.contact,
            data.parent_contact,
            data.address,
            data.total_fees,
            data.pending_fees,
            data.institute_code,
            data.username,
            data.password,
            data.name,
        ));


        
        


class TeacherData:
    from models.db.users.teacher import Teachers  
    def create_table_in_db(self,engine):   
        engine.execute(
            """
            CREATE TABLE IF NOT EXISTS teacher (
            id  INTEGER SERIAL PRIMARY KEY,
            institute_id  INTEGER NOT NULL,
            qualification  VARCHAR NOT NULL,
            phonenumber  INTEGER NOT NULL,
            key_subject  VARCHAR NOT NULL,
            username  VARCHAR NOT NULL,
            email VARCHAR NOT NULL,
            password  VARCHAR NOT NULL );
            """)

    def create_user_in_db(self, engine, data: Teachers):
        engine.execute(
            """
            INSERT INTO teacher (
                institute_id,
                qualification,
                phonenumber,
                key_subject,
                username,
                email,
                password,
            )
            VALUES (
                '{0}',
                '{1}',
                '{2}',
                '{3}',
                '{4}',
                '{5}',
                '{6}',
            );
            """.format(
                data.institute_id,
                data.qualification,
                data.phonenumber,
                data.key_subject,
                data.username,
                data.email,
                data.password,
            )
        )



class ParentData:


    pass
