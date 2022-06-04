from datetime import datetime
from pydantic import BaseModel
<<<<<<< HEAD
=======
from sqlalchemy import VARCHAR
>>>>>>> 7cc771d7e2da6e1a0a4e36aed9eef305d0d4b3cb


class Spayment(BaseModel):
    id: int
    student_id: int
    institute_id: int
    course_id: int
    pending_fees: int
    total_fees: int
    time: datetime