# app/main.py

from fastapi import FastAPI, File, UploadFile, HTTPException, Body
from fastapi.responses import StreamingResponse
from rembg import remove
from PIL import Image
import io
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import requests
from pyfcm import FCMNotification

app = FastAPI(title="API Rest nivel 2")

# Inicialize o serviço FCM
push_service = FCMNotification(api_key="BKgUNYSljp5b8bD2T6ffPHGAu0JBQPqWOFH6NvuiXFnGiqky2c08P-J3Ut787c_mtjEs8ZxvjdMnytbVikU-FsY ")

def send_notification_to_user(token, title, message):
    result = push_service.notify_single_device(registration_id=token, message_title=title, message_body=message)
    return result

@app.post("/process-image", tags=["images"])
async def process_image(file: UploadFile = File(...)):
    try:
        # Processar a imagem
        contents = await file.read()
        input_image = Image.open(io.BytesIO(contents)).convert("RGBA")
        output_image = remove(input_image)
        byte_arr = io.BytesIO()
        output_image.save(byte_arr, format="PNG")
        byte_arr = byte_arr.getvalue()
        
        # Token FCM mockado para testes
        fcm_token = "dgnsd194ui39tnck0DJFJQf0mslsd"
        
        # Enviar notificação
        send_notification_to_user(fcm_token, "Imagem Processada", "Sua imagem foi processada com sucesso.")
        
        return StreamingResponse(io.BytesIO(byte_arr), media_type="image/png")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

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