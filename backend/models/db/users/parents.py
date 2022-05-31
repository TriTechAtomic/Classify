from pydantic import BaseModel


class Parents(BaseModel):
    id:int
    student_id:int
    institute_id:int