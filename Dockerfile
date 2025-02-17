FROM python:3.9

WORKDIR /app

COPY app/models /app/models
COPY requirements.txt requirements.txt

RUN pip install uv && \
    uv venv && \
    uv pip install -r requirements.txt

COPY . .

CMD ["uvicorn", "app.fastapi_penguins:app", "--host", "0.0.0.0", "--port", "${PORT:-8989}"]
