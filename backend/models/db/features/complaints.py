from datetime import datetime
from pydantic import BaseModel
from sqlalchemy import VARCHAR


class Complaints(BaseModel):
    id: int
    student_id: int
    institute_id: int
    subject: VARCHAR
    description: VARCHAR
    time: datetime