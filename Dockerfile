FROM python:3.10

WORKDIR /app

ADD . /app

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y --no-install-recommends ffmpeg

RUN pip install -r requirements.txt

ENV MODEL_SIZE=small

CMD ["uvicorn", "app:app" , "--host", "0.0.0.0", "--port", "8000"]
