from pydantic import BaseModel


class Students(BaseModel):
    id: int
    institute_id: int
    course_id: int
    age: int
    gender: str
    contact: int
    parent_contact: int
    address: str
    total_fees: float
    pending_fees: float
    institute_code: int
    username: str
    password: str
    name: str