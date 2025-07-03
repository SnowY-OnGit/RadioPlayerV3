FROM python:3.10-slim

# Install ffmpeg, git, and system dependencies
RUN apt-get update && apt-get install -y ffmpeg git && apt-get clean

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["python3", "main.py"]
