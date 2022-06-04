from pydantic import BaseModel


class Signin(BaseModel):
    username_or_email: str
    password: str
    