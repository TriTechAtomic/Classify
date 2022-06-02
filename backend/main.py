from fastapi import FastAPI
from dbcreds import DbController
from models.db.users.institute import  Institute
from models.db.users.students import Students
from models.db.users.teacher import Teachers
from models.response.sign_in import  Signin

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

@app.post("/signinInstitute")
async def signin(data: Signin):
    isValidUser =  dbCon.validate_institute_creds(data=data)
    print("incoming data >>>> ",data,"\n","is the user valid >>>>>>>>>>>",isValidUser)
    return isValidUser

@app.post("/signupInstitute")
async def signup(data: Institute):
    dbCon.create_institute(data)
    return True
 
@app.post("/signinTeacher")
async def signin(data: Signin):
    return dbCon.validate_teacher(data=data)

@app.post("/signupTeacher")
async def signup(data: Teachers):
    return dbCon.create_teacher(data)
    
@app.post("/signupStudent")
async def signup(data: Students):
    return  dbCon.create_student(data)

@app.post("/signinStudent")
async def signin(data: Signin):
    return dbCon.validate_student(data=data)

