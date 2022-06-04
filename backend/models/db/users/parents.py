from pydantic import BaseModel


class Parents(BaseModel):
    student_id:int
    institute_id:int