from datetime import datetime
from pydantic import BaseModel
<<<<<<< HEAD
=======
from sqlalchemy import VARCHAR
>>>>>>> 7cc771d7e2da6e1a0a4e36aed9eef305d0d4b3cb


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
