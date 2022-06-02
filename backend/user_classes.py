

import bcrypt


class InstituteData: 
    from models.db.users.institute import Institute
    def __init__(self):

        self.tableName = 'institute';


    def create_table_in_db(self,engine):
        engine.execute(

            '''
            CREATE TABLE IF NOT EXISTS institute (
                id SERIAL PRIMARY KEY,
                username VARCHAR(255) NOT NULL,
                password BYTEA NOT NULL,
                institutes_name VARCHAR(255) NOT NULL,
                email VARCHAR(255) NOT NULL,
                contact VARCHAR(255) NOT NULL,
                state VARCHAR(255) NOT NULL,
                city VARCHAR(255) NOT NULL,
                pincode VARCHAR(255) NOT NULL,
                area VARCHAR(255) NOT NULL,
                subscription_id VARCHAR(255) NOT NULL);
            '''
        )
    
    def create_user_in_db(self, engine, data: Institute):
        # Insert query using Institute data class
        # abhee institue ka bana hai  
        statement = '''
            INSERT INTO institute (
                username,
                password,
                institutes_name,
                email,
                contact,
                state,
                city,
                pincode,
                area,
                subscription_id
            )
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
                '{9}'
            );
        '''.format(
            data.username,
            bcrypt.hashpw((data.password).encode('utf-8'), bcrypt.gensalt()),
            data.institutes_name,
            data.email,
            data.contact,
            data.state,
            data.city,
            data.pincode,
            data.area,
            data.subscription_id
        )  
        engine.execute(statement)

    


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
