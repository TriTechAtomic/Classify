from pydantic import BaseModel

class Tpayments(BaseModel):
    id: int
    teachers_id: int
    institute_id: int
    method: str  
    total_payment: float
    paid: float
    pending: float
    lectures_id: int
    hours: float