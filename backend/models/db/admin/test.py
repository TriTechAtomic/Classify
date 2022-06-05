from datetime import datetime
from pydantic import BaseModel


class Test(BaseModel):
    id: int
    institute_id: int
    name: str
    subject_id: int
    course_id: int
    
    test_type: str
    total_marks: int
    passing_marks: int
    date: datetime
    duration: int
