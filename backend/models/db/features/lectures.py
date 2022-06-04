from datetime import datetime
from pydantic import BaseModel


class Lectures(BaseModel):
    id: int
    attendence_id: int
    institute_id: int
    subject_id: int
    teacher_id: int
    course_id: int

    date: datetime
    start_time: datetime
    end_time: datetime

    numbers_of_lectures: int

