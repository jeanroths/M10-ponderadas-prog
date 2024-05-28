# app_envio_imagens/Dockerfile

FROM python:3.8-slim

WORKDIR /app_envio_imagens

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD ["python3", "main.py"]