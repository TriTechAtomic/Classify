from datetime import datetime
from pydantic import BaseModel

class Subject(BaseModel):
    institute_id: int
    name: str
    course_id: int
    teacher_id: int


