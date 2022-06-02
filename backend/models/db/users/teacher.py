from pydantic import BaseModel


class Teachers(BaseModel):
    id: int
    institute_id: int
    qualification: str
    phonenumber: int
    key_subject: str
    username: str
    email:str
    password: str