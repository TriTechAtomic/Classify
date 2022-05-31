from pydantic import BaseModel
from sqlalchemy import VARCHAR

class Tpayments(BaseModel):
    id: int
    teachers_id: int
    institute_id: int
    method: VARCHAR    
    total_payment: float
    paid: float
    pending: float
    lectures_id: int
    hours: float