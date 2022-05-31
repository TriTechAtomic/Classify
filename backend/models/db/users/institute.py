from pydantic import BaseModel
from sqlalchemy import VARCHAR

class Institute(BaseModel):
    username: VARCHAR
    password: VARCHAR
    institutes_name: VARCHAR
    email: VARCHAR
    contact: int
    state: VARCHAR
    city: VARCHAR
    pincode: int
    area: VARCHAR
    subscription_id: int
    