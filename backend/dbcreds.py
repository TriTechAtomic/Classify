

from backend.models.institute import Signup


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

        from sqlalchemy import create_engine
        self.engine = create_engine(
            url="postgresql://{0}:{1}@{2}:{3}/{4}".format(
                conData.user,
                conData.password,
                conData.host,
                conData.port, 
                conData.database
            )
        )
        self.engine.connect()
    
    def create_user_in_db(self, userdata:Signup):
        pass
        

        
        
