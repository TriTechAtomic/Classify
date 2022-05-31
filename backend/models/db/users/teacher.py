from pydantic import BaseModel
from sqlalchemy import VARCHAR


class Teachers(BaseModel):
    id: int
    institute_id: int
    qualification: VARCHAR
    key_subject: VARCHAR
    username: VARCHAR
    email:VARCHAR
    password: VARCHAR