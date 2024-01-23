FROM python:3.10

WORKDIR /app

ADD . /app

RUN pip install -r requirements.txt

EXPOSE 8000

ENV MODEL_SIZE=small

CMD ["python", "app.py"]
