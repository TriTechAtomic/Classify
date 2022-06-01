from fastapi import FastAPI
from backend.dbcreds import DbController

app = FastAPI()
dbCon =  DbController()

from backend.dbcreds import DbController

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

@app.post("/signup")
async def signup():
    # TODO:
    # 1. Check if user exists already ? signup is not allowed : pass 
    # 2. Create user
    # 3. Generate JWT token
    # 4. Return JWT token
    pass



