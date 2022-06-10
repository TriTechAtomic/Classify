from pydantic import BaseModel


class Teachers(BaseModel):
    qualification: str
    phonenumber: str
    key_subject: str
    username: str
    email:str
    password: str
