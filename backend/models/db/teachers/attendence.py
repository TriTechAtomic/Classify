from pydantic import BaseModel


class Attendence(BaseModel):
    id: int
    student_id: int
    institute_id: int
    teacher_id: int
    present:bool
    date: str
    status: str
    time: str