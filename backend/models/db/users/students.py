from pydantic import BaseModel


class Students(BaseModel):
    institute_id: int
    course_id: int
    age: int
    gender: str
    contact: str
    parent_contact: int
    address: str
    total_fees: float
    pending_fees: float
    institute_code: int
    email :str
    username: str
    password: str
    name: str
