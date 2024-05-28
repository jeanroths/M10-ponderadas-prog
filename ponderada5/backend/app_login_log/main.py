# app/main.py

from fastapi import FastAPI, Body, Depends, HTTPException, Path
from auth.jwt_handler import signJWT
from auth.jwt_bearer import jwtBearer
from logs.logger import setup_logger
from db import database, User
from models import UserSchema
from fastapi.middleware.cors import CORSMiddleware
import uvicorn

app = FastAPI(title="API Rest nivel 2")
logger = setup_logger('userRoutes')

async def check_user(data: UserSchema):
    if not database.is_connected:
        await database.connect()
    users = await User.objects.all()
    for user in users:
        if user.email == data.email and user.password == data.password:
            return True
    return False

    
@app.get("/")
async def read_root():
    return await ToDo.objects.all()

@app.get("/users/", tags=["users"])
async def read_user(id: int):
    if not database.is_connected:
        await database.connect()
    return await User.objects.get(id=id)


@app.post("/users/signup", tags=["users"])
async def create_user(user: UserSchema = Body(default=None)):
    if not database.is_connected:
        await database.connect()
    await User.objects.create(
        email=user.email,
        password=user.password
    )
    logger.info("Usuário criado")
    return signJWT(user.email)

@app.post("/users/login", tags=["users"])
async def user_login(user: UserSchema = Body(default=None)):
    if await check_user(user):
        logger.info("Usuário logado")
        return signJWT(user.email)
    raise HTTPException(status_code=404, detail=f"{user.email} não encontrado")
        

@app.delete("/users/delete/{id}", tags=["users"], dependencies=[Depends(jwtBearer())])
async def delete_user(id: int):
    if not database.is_connected:
        await database.connect()
    return await User.objects.delete(id=id)


@app.on_event("startup")
async def startup():
    if not database.is_connected:
        await database.connect()
    # create a dummy entry
    # await User.objects.get_or_create(email="test@test.com", password="senha")
    # await ToDo.objects.get_or_create(title="test", content="test", user_id=1)


@app.on_event("shutdown")
async def shutdown():
    if database.is_connected:
        await database.disconnect()

origins = ["*"]  # Substitua pelo URL do seu frontend
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8001)