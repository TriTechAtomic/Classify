from datetime import datetime
from pydantic import BaseModel
from sqlalchemy import VARCHAR


class Test(BaseModel):
    id: int
    institute_id: int
    name: VARCHAR
    subject_id: int
    course_id: int
    
    test_type: VARCHAR
    total_marks: int
    passing_marks: int
    date: datetime
    duration: int
