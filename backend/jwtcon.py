from datetime import datetime, timedelta
import os
import jwt
from fastapi import Header ,HTTPException
 
ACCESS_TOKEN = "caia2XiQbhOlj51CcNeTtq3Bckaj6ewJdnWfWAt2"
REFRESH_TOKEN = "WNKHzhI9ndzWi7N0XULQPq9dMcVrqfValoA-WpiA"

def create_access_token (username: str, role: str):
    return jwt.encode({
            "username":username,
            "role":role,
            "exp":datetime.utcnow()+timedelta(seconds=300),
            "iat": datetime.utcnow()
            },
            ACCESS_TOKEN, algorithm='HS256')

def create_refresh_token (username: str, role: str):
    return jwt.encode({
            "username":username,
                "role":role,
            "exp":datetime.utcnow()+timedelta(days=7),
            "iat": datetime.utcnow()
            },
            REFRESH_TOKEN, algorithm='HS256')

def refresh_required(token: str = Header(None)):
    # verify the token
    if token:
        try:
           return jwt.decode(token, REFRESH_TOKEN, algorithms=['HS256'])
        except jwt.ExpiredSignatureError:
            raise HTTPException(status_code=400, detail="Signature expired")
        except jwt.InvalidTokenError:
            raise HTTPException(status_code=401, detail="X-Token header invalid")
    else :
        raise HTTPException(status_code=401, detail="X-Token header missing")
    
def access_required(token: str = Header(None)):
    # verify the token
    if token:
        try:
           return jwt.decode(token, ACCESS_TOKEN, algorithms=['HS256'])
        except jwt.ExpiredSignatureError:
            raise HTTPException(status_code=400, detail="Signature expired")
        except jwt.InvalidTokenError:
            raise HTTPException(status_code=401, detail="X-Token header invalid")
    else :
        raise HTTPException(status_code=401, detail="X-Token header missing")

