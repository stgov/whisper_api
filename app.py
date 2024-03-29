from fastapi import FastAPI, File, UploadFile
import whisper
import os

app = FastAPI()
model = os.environ.get("MODEL_SIZE", "small")

@app.on_event("startup")
async def startup_event():
  global model
  model = whisper.load_model(model)

@app.post("/")
async def transcription(file: UploadFile):
  filename = file.filename  # Get the filename
  with open(filename, 'wb') as f:
    while contents := file.file.read(1024 * 1024):
      f.write(contents)
  file.file.close()
  yield model.transcribe(filename)["text"]
  os.remove(filename)

