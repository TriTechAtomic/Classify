from numpy import double
from pydantic import BaseModel
from sqlalchemy import VARCHAR


class Students(BaseModel):
    id: int
    institute_id: int
    course_id: int
    age: int
    gender: VARCHAR
    contact: int
    parent_contact: int
    address: VARCHAR
    total_fees: float
    pending_fees: float
    institute_code: int
    username: VARCHAR
    password: VARCHAR
    name: VARCHAR