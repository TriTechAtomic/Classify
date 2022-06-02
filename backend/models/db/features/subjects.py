from datetime import datetime
from pydantic import BaseModel


class Subject(BaseModel):
    id: int
    institute_id: int
    name: str
    course_id: int
    created_at: datetime
    updated_at: datetime