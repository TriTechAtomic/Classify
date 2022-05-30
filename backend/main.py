from fastapi import FastAPI
from backend.dbcreds import DbController
from backend.models.institute import Signup

app = FastAPI()
dbCon =  DbController()



@app.get("/")
async def root():
    return {"message": ">> Hello from xxparthparekhxx >>"}

''' 
TODO create a new endpoint
where user can signup for account and store the data in mysql database and get a JWT token in the respose  
create a dataclass for user data
'''





@app.post("/signup", response_model=Signup)
async def signup():
    pass    




