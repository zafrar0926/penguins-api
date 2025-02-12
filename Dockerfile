FROM python:3.9

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "app.fastapi_penguins:app", "--host", "0.0.0.0", "--port", "8989"]
