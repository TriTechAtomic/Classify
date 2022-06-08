from fastapi import Depends, FastAPI,Header
from dbcreds import DbController
from models.db.users.institute import  Institute
from models.db.users.students import Students
from models.db.users.teacher import Teachers
from models.response.sign_in import  Signin

from jwtcon import create_access_token,  create_refresh_token, access_required, refresh_required


app = FastAPI()
dbCon =  DbController()

@app.get("/")
async def root():
    return {"message": ">> Hello from xxparthparekhxx >>"}

@app.get("/newaccesstoken",dependencies=[Depends(refresh_required)])
async def refresh_token(token: str = Header(None)):
    data = refresh_required(token)
    print(data)
    return {
        "access_token": create_access_token(data['username'],data['role']),
        "refresh_token": create_refresh_token(data['username'],data['role'])
    }

@app.get("/authonlyRouteTest" , dependencies=[Depends(access_required)])
async def authonlyRouteTest():
    return {"message": ">> Hello from xxparthparekhxx >> \n You are authorized to access this route"}


'''
 Institue ROUTES
 Todos 
 [X] Get User Details 
 [] Create Course
 [] Enroll Student
 [] Enroll Teacher
'''

@app.get("/userdetails",dependencies=[Depends(access_required)])
async def get_user_details(token: str = Header(None)):
    userdetails =access_required(token)
    role=userdetails['role']
    username = userdetails['username']
    print(userdetails)
    if  role == "institute":
        data =  dbCon.institute.get_user_by_username(username)
        print(data)
        return data
    elif role == "teacher":
        data =  dbCon.teacher.get_user_by_username(username)
        print(data)
        return data
    elif role == "student":
        data =  dbCon.student.get_user_by_username(username)
        print(data)
        return data
    else: 
        return {"message": ">> You are not authorized to access this route"}



@app.post("/signinInstitute")
async def signin(data: Signin):
    isValidUser =  dbCon.validate_institute_creds(data=data)
    if isValidUser:
        access_token = create_access_token(data.username_or_email, "institute")
        refresh_token = create_refresh_token(data.username_or_email, "institute")
        return { "access_token": access_token, "refresh_token": refresh_token }
    return {"message": "Invalid Credentials"}

@app.post("/signupInstitute")
async def signup(data: Institute):
    return dbCon.create_institute(data)
    
 
@app.post("/signinTeacher")
async def signin(data: Signin):
    isValidUser =  dbCon.validate_teacher(data=data)
    if isValidUser:
        access_token = create_access_token(data.username_or_email , "teacher")
        refresh_token = create_refresh_token(data.username_or_email , "teacher")
        return { "access_token": access_token, "refresh_token": refresh_token }
    return {"message": "Invalid Credentials"}


@app.post("/signupTeacher")
async def signup(data: Teachers):
    return dbCon.create_teacher(data)

   
    
@app.post("/signupStudent")
async def signup(data: Students):
    return  dbCon.create_student(data)

@app.post("/signinStudent")
async def signin(data: Signin):
    isValidUser =  dbCon.validate_student(data=data)
    if isValidUser:
        access_token = create_access_token(data.username_or_email,"student")
        refresh_token = create_refresh_token(data.username_or_email,"student")
        return { "access_token": access_token, "refresh_token": refresh_token }
    return {"message": "Invalid Credentials"}

