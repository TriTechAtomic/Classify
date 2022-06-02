from fastapi import FastAPI
from dbcreds import DbController
from models.db.users.institute import  Institute

# haaaaa de sakte hai 
# nehai bhai 
# itna sub kamm kia vo sub nehai feekna

app = FastAPI()
dbCon =  DbController()

@app.get("/")
async def root():
    return {"message": ">> Hello from xxparthparekhxx >>"}

@app.get("/refresh-t")
async def refresh_token():
    #TODO:
    # 1. Get the refresh token from the request
    # 2. Validate the refresh token
    # 3. Return a new access token
    pass

@app.post("/signin")
async def signin():
    

    

    # TODO:
    # 1. Check if user exists
    # 2. Check if password is correct
    # 3. Generate JWT token
    # 4. Return JWT token    
    pass

@app.post("/signupInstitute")
async def signup(data: Institute):
    dbCon.create_institute(data)

    return ''
 



