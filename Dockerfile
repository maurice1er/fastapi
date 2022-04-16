FROM python:latest

WORKDIR /usr/src/app

#RUN apt-get upgrade -y 
#RUN apt-get update && apt-get install -y build-essential python3-dev python3-pip

COPY ./requirements.txt .

RUN pip3 install -r requirements.txt

COPY . . 

# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]
CMD ["python3", "main.py"]


