FROM python:3.11-slim-bullseye
#python:latest

LABEL app="fastapi"

WORKDIR /usr/src/app

COPY ./requirements.txt .

RUN pip3 install -r requirements.txt

COPY . . 

# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]
CMD ["python3", "main.py"]


