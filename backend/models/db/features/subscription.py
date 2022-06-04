from pydantic import BaseModel


class Subscription(BaseModel):
    id : int
    institute_id : int
    plans:str
