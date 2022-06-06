from datetime import datetime
from pydantic import BaseModel


class Complaints(BaseModel):
    id: int
    student_id: int
    institute_id: int
    subject: str
    description: str
    time: datetime