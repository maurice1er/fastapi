FROM python:3.8

WORKDIR /usr/src/app

# RUN apt-get update -y && apt-get install -y python3-pip python3-dev 
RUN apt -y update
RUN apt install -yq python3-dev
RUN apt install -yq python3-pip

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY . . 

# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]
CMD ["python3", "main.py"]


