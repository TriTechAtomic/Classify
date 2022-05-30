from datetime import datetime
from pydantic import BaseModel
from sqlalchemy import VARCHAR


class Announcements(BaseModel):
    id: int
    institute_id: int
    subject: VARCHAR
    message: VARCHAR
    time: datetime
    type: VARCHAR
    