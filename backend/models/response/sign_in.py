from pydantic import BaseModel


class signin(BaseModel):
    username: str
    password: str
    