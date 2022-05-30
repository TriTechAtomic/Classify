from pydantic import BaseModel


class Marks(BaseModel):
    id: int
    student_id: int
    institute_id: int
    test_id: int
    marks: float