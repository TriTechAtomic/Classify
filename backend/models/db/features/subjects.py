from datetime import datetime
from pydantic import BaseModel
from sqlalchemy import VARCHAR


class Subject(BaseModel):
    id: int
    institute_id: int
    name: VARCHAR
    course_id: int
    created_at: datetime
    updated_at: datetime