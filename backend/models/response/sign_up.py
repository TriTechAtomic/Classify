from pydantic import BaseModel


class Signup(BaseModel):
    username: str
    password: str
    email: str
    phonenumber: int
    address: str
    city: str
    state: str
    zipcode: int
    country: str
    role: str
