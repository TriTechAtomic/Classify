from pydantic import BaseModel


class Courses(BaseModel):
    institute_id: int
    name: str
    description: str
    duration: int
    fees: int
    start_date: str
    end_date: str
    