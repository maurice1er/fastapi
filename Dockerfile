FROM python:3.8

WORKDIR /usr/src/app

RUN apt upgrade -y && apt update -y 
RUN apt install -y build-essential python3-dev python3-pip

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY . . 

# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]
CMD ["python3", "main.py"]


