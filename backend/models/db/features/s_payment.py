from datetime import datetime
from pydantic import BaseModel


class Spayment(BaseModel):
    id: int
    student_id: int
    institute_id: int
    course_id: int
    pending_fees: int
    total_fees: int
    time: datetime