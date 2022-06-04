from datetime import datetime, timedelta
import os
import jwt
from fastapi import Header ,HTTPException

def create_access_token (username: str):
    return jwt.encode({
            "username":username,
            "exp":datetime.utcnow()+timedelta(seconds=300),
            "iat": datetime.utcnow()
            },
            os.getenv("ACCESS_TOKEN"), algorithm='HS256')

def create_refresh_token (username: str):
    return jwt.encode({
            "username":username,
            "exp":datetime.utcnow()+timedelta(days=7),
            "iat": datetime.utcnow()
            },
            os.getenv("REFRESH_TOKEN"), algorithm='HS256')



def refresh_required(token: str = Header(None)):
    # verify the token
    if token:
        try:
           return jwt.decode(token, os.getenv("REFRESH_TOKEN"), algorithms=['HS256'])
        except jwt.ExpiredSignatureError:
            raise HTTPException(status_code=400, detail="Signature expired")
        except jwt.InvalidTokenError:
            raise HTTPException(status_code=401, detail="X-Token header invalid")
    else :
        raise HTTPException(status_code=401, detail="X-Token header missing")
    

def access_required(Token: str = Header(None)):
    # verify the token
    if Token:
        try:
           return jwt.decode(Token, os.getenv("ACCESS_TOKEN"), algorithms=['HS256'])
        except jwt.ExpiredSignatureError:
            raise HTTPException(status_code=400, detail="Signature expired")
        except jwt.InvalidTokenError:
            raise HTTPException(status_code=401, detail="X-Token header invalid")
    else :
        raise HTTPException(status_code=401, detail="X-Token header missing")

