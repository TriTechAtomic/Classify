from pydantic import BaseModel
from sqlalchemy import VARCHAR


class Attendence(BaseModel):
    id: int
    student_id: int
    institute_id: int
    teacher_id: int
    present:bool
    date: VARCHAR
    status: VARCHAR
    time: VARCHAR