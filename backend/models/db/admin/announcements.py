from datetime import datetime
from pydantic import BaseModel


class Announcements(BaseModel):
    id: int
    institute_id: int
    subject: str
    message: str
    time: datetime
    type: str
    