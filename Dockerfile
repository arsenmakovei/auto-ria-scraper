FROM python:3.10-slim
LABEL maintainer="makoveyarsen@gmail.com"

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN apt-get update && apt-get install -y postgresql-client-15

COPY . .

CMD ["python", "scheduler.py"]
