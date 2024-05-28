from pydantic import BaseModel, Field, EmailStr

# Classe para representar os usuários do sistema
class UserSchema(BaseModel):
    #id : int = Field(default=None, gt=0)
    email : EmailStr = Field(default=None)
    password : str = Field(default=None)
    class Config:
        schema_extra = {
            "schema_user" : {
                "email": "teste@mail.com",
                "password":"123",
                "id": 1
            }
        }