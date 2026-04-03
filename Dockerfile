# Don't Remove Credit @VJ_Bots
# Subscribe YouTube Channel For Amazing Bot @Tech_VJ
# Ask Doubt on telegram @KingVJ01

FROM python:3.10-slim-buster

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    gcc libffi-dev ffmpeg aria2 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

CMD ["python3", "main.py"]
