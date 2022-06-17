from datetime import datetime
from pydantic import BaseModel
from users.teacher import Teachers

class Subject(BaseModel):
    id: int
    institute_id: int
    name: str
    course_id: int
    teacher_id: int


