from pydantic import BaseModel
from sqlalchemy import VARCHAR


class Courses(BaseModel):
    id: VARCHAR
    institute_id: int
    name: VARCHAR
    description: VARCHAR
    duration: int
    fees: int
    start_date: VARCHAR
    end_date: VARCHAR
    