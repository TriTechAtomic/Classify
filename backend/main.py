from fastapi import Depends, FastAPI,Header ,HTTPException
from dbcreds import DbController
from models.db.users.institute import  Institute
from models.db.users.students import Students
from models.db.users.teacher import Teachers
from models.response.sign_in import  Signin

from jwtcon import create_access_token, create_invite_token,  create_refresh_token, access_required, refresh_required, verify_invite_token


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



'''
 Institue ROUTES
 Todos 
 [X] Get User Details 
 [X] Enroll Teacher
 
 [] Create Course
 [] Enroll Student
'''




@app.get("/userdetails",dependencies=[Depends(access_required)])
async def get_user_details(token: str = Header(None)):
    userdetails =access_required(token)
    role=userdetails['role']
    username = userdetails['username']
    return dbCon.get_user_details(username=username,role=role)


# institute
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
    
 

# teacher
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

   
# student   
@app.post("/signupStudent")
async def signup(data: Students):
    return  dbCon.create_student(data)

@app.get("createTeacherInvite",depends=[Depends(create_invite_token, access_required)])
async def create_teacher_invite(institute_id: int = Header(None), teacher_id: int = Header(None), token: str = Header(None)):
    return create_invite_token(institute_id, teacher_id, token) 



@app.post("/joinInstitueAsTeacher",dependencies=[Depends(verify_invite_token,access_required)])
async def join_institue_as_teacher(inviteToken : str = Header(None) ,token: str = Header(None)):

    userdetails =access_required(token)
    invite_details = verify_invite_token(inviteToken)
    if invite_details:
        teacher_id =  invite_details['teacher_id']
        institute_id = invite_details['institute_id']
        
        role=userdetails['role']
        username = userdetails['username']

        accessing_teacher_id =dbCon.get_user_details(username=username,role=role)["id"] 

        if accessing_teacher_id == teacher_id: # check if the invited teacher is the one who is trying to join

            if  role == "teacher":
                return dbCon.join_institute_as_teacher(institute_id=institute_id,teacher_id=accessing_teacher_id)
            else:
                return HTTPException(status_code=400, detail="You are not a teacher")
        else:
            return HTTPException(status_code=400, detail="You are not authorized to join this institute")

@app.post("/getTeachers",dependencies=[Depends(access_required)])
async def get_teachers(token: str = Header(None)):
    user_details = access_required(token)
    role=user_details['role']
    username = user_details['username']
    if  role == "institute":
        Instituteid =dbCon.get_user_details(username,role)
        return dbCon.get_all_teachers_in_institute(institute_id=Instituteid['id'])
    else:
        return {"message": ">> You are not authorized to access this route"}

@app.get("/teacherDetails",dependencies=[Depends(access_required)])
async def get_teacher_details(token: str = Header(None)):
    userDetails = access_required(token)
    role=userDetails['role']
    username = userDetails['username']
    if  role == "teacher":
        teacher = dbCon.get_user_details(username,role)
        return {
            "username": teacher['username'], 
            "email": teacher['email'],
            "key_subject": teacher['key_subject'],
            "phonenumber":teacher['phonenumber'],
        }
    else:
        return {"message": ">> You are not authorized to access this route"}

    
@app.post("/signinStudent")
async def signin(data: Signin):
    isValidUser =  dbCon.validate_student(data=data)
    if isValidUser:
        access_token = create_access_token(data.username_or_email,"student")
        refresh_token = create_refresh_token(data.username_or_email,"student")
        return { "access_token": access_token, "refresh_token": refresh_token }
    return {"message": "Invalid Credentials"}


