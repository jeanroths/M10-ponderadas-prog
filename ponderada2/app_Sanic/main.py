from sanic import Sanic, response
from sanic.request import Request
from sanic.response import HTTPResponse, json
from sanic_ext import Extend
from auth.jwt_handler import signJWT
from auth.jwt_bearer import jwtBearer
from sanic.exceptions import ServerError

from db import database, User, ToDo
from models import ToDoSchema, UserSchema

app = Sanic("API-Rest-level-2")
app.config.CORS_ORIGINS = "http://foobar.com,http://bar.com"
Extend(app)


@app.middleware('request')
async def jwt_middleware(request: Request):
    if request.path not in ['/users/signup', '/users/login', '/', '/docs', '/docs/openapi.json', '/users/<id:int>' ]:
        token = request.headers.get('Authorization')
        if not token or not jwtBearer():
            return json({"error": "Token inválido"}, status=401)


@app.route("/")
async def read_root(request: Request) -> HTTPResponse:
    users = await User.objects.all()
    user_dicts = [user.__dict__ for user in users]
    return json(user_dicts)


@app.route("/users/<id:int>", methods=["GET"])
async def read_user(request: Request, id: int) -> HTTPResponse:
    if not database.is_connected:
        await database.connect()
    user = await User.objects.get(id=id)
    return json(user.__dict__)


@app.route("/todo", methods=["GET"])    
async def read_todo(request: Request) -> HTTPResponse:
    #user_id = int(request.args.get("user_id"))
    if not database.is_connected:
        await database.connect()
    todos = await ToDo.objects.all()
    todo_dicts = [todo.__dict__ for todo in todos]
    return json(todo_dicts)


@app.route("/users/signup", methods=["POST"])
async def create_user(request: Request) -> HTTPResponse:
    user = UserSchema(**request.json)
    if not database.is_connected:
        await database.connect()
    await User.objects.create(
        email=user.email,
        password=user.password
    )
    access_token = signJWT(user.email)
    return json({"access_token": access_token})  # Retorna um dicionário com o token JWT



@app.route("/users/login", methods=["POST"])
async def user_login(request: Request) -> HTTPResponse:
    user = UserSchema(**request.json)
    if await check_user(user):
        access_token = signJWT(user.email)
        return json({"access_token": access_token})  # Retorna um dicionário com o token JWT
    raise ServerError("Usuário ou senha inválidos", status_code=401)


@app.route("/todo", methods=["POST"])
async def create_todo(request: Request) -> HTTPResponse:
    todo_data = request.json
    title = todo_data.get("title")
    content = todo_data.get("content")
    user_id = todo_data.get("user_id")
    
    if not database.is_connected:
        await database.connect()
    
    # Cria o objeto ToDo no banco de dados
    todo = await ToDo.objects.create(title=title, content=content, user_id=user_id)
    
    # Retorna o objeto ToDo como dicionário serializável
    todo_dict = todo.__dict__
    return json(todo_dict, status=201)


@app.route("/todo/update", methods=["PUT"])
async def update_todo(request: Request) -> HTTPResponse:
    todo_data = request.json
    todo_id = todo_data.get("id")
    title = todo_data.get("title")
    content = todo_data.get("content")
    user_id = todo_data.get("user_id")
    
    if not database.is_connected:
        await database.connect()
    
    # Atualiza ou cria o objeto ToDo no banco de dados
    todo = await ToDo.objects.update_or_create(
        id=todo_id,
        title=title,
        content=content,
        user_id=user_id
    )
    
    # Retorna o objeto ToDo como dicionário serializável
    todo_dict = todo.__dict__
    return json(todo_dict)



@app.route("/todo/delete/<id:int>", methods=["DELETE"])
async def delete_todo(request: Request, id: int) -> HTTPResponse:
    if not database.is_connected:
        await database.connect()
    return json(await ToDo.objects.delete(id=id))


@app.route("/users/delete/<id:int>", methods=["DELETE"])
async def delete_user(request: Request, id: int) -> HTTPResponse:
    if not database.is_connected:
        await database.connect()
    return json(await User.objects.delete(id=id))


async def check_user(data: UserSchema):
    if not database.is_connected:
        await database.connect()
    users = await User.objects.all()
    for user in users:
        if user.email == data.email and user.password == data.password:
            return True
    return False


@app.listener('before_server_start')
async def before_start(app, loop):
    if not database.is_connected:
        await database.connect()


@app.listener('after_server_stop')
async def after_stop(app, loop):
    if database.is_connected:
        await database.disconnect()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8001, debug=True)
