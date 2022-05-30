from pydantic import BaseModel
from sqlalchemy import VARCHAR


class Subscription(BaseModel):
    id : int
    institute_id : int
    plans:VARCHAR
