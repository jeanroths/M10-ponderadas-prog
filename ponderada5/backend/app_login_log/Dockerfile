# app_login_log/Dockerfile

FROM python:3.8-slim

WORKDIR /app_login_log

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD ["python3", "main.py"]