from pydantic import BaseModel

class Institute(BaseModel):
    username: str
    password: str
    institutes_name: str
    email: str
    contact: str
    state: str
    city: str
    pincode: int
    area: str
    subscription_id: int
    