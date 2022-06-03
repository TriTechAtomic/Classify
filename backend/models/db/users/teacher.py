from pydantic import BaseModel


class Teachers(BaseModel):
    institute_id: int
    qualification: str
    phonenumber: str
    key_subject: str
    username: str
    email:str
    password: str