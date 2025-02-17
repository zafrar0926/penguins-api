# 🐧 Penguin Species Prediction API

Este proyecto es una **API** construida con **FastAPI** y **Docker Compose**, que permite predecir la especie de un pingüino a partir de sus características morfológicas utilizando **modelos de Machine Learning**.  
Se incluyen contenedores para **FastAPI y JupyterLab**, permitiendo **entrenar y actualizar modelos dinámicamente sin reconstruir la API**.

---

## 🚀 Tecnologías Utilizadas

- **FastAPI** (para construir la API)
- **Uvicorn** (servidor ASGI)
- **Scikit-learn** (para los modelos de ML)
- **Joblib** (para cargar los modelos entrenados)
- **Docker & Docker Compose** (para contenerización y orquestación de servicios)
- **JupyterLab** (para el entrenamiento de modelos)
- **UV** (para la gestión de entornos virtuales de Python)

---

## 📚 Estructura del Proyecto

```
📎 penguin_project
│-- 📂 app/                  # Código de la API en FastAPI
│   │-- 📄 fastapi_penguins.py  # API FastAPI con modelos ML
│-- 📂 models/               # Modelos entrenados (.pkl)
│-- 📂 static/               # Archivos estáticos (index.html, CSS, JS)
│-- 📄 Dockerfile            # Configuración de la imagen Docker
│-- 📄 docker-compose.yml    # Orquestación de servicios con Docker Compose
│-- 📄 requirements.txt      # Dependencias del proyecto
│-- 📄 requirements.uv       # Dependencias del proyecto con UV
│-- 📄 README.md             # Documentación del proyecto
```

---

## 🛠️ Instalación y Ejecución Local

### 1️⃣ Clonar el Repositorio  
```bash
git clone https://github.com/tu-usuario/penguin-api.git
cd penguin-api
```

### 2️⃣ Construir y levantar los contenedores con Docker Compose  
```bash
docker-compose up --build
```
Esto levantará:

- **JupyterLab** en el puerto **8888**
- **FastAPI** en el puerto **8989**

### 3️⃣ Acceder a los servicios:

🔹 **API FastAPI:** 👉 [http://localhost:8989/docs](http://localhost:8989/docs)  
🔹 **JupyterLab:** 👉 [http://localhost:8888/lab](http://localhost:8888/lab)

---

## 🐳 Uso con Docker

**Para construir la imagen manualmente:**  
```bash
docker build -t penguin_api .
```

**Para ejecutar el contenedor manualmente:**  
```bash
docker run -p 8989:8989 --name penguin_container penguin_api
```

---

## 📌 Docker Compose: Servicios y Volumen Compartido

Este proyecto usa **Docker Compose** para definir y conectar los servicios:

```yaml
version: "3.8"

services:
  jupyterlab:
    image: python:3.9
    container_name: jupyter_container
    working_dir: /workspace
    volumes:
      - shared_models:/workspace/models
    ports:
      - "8888:8888"
    command: >
      bash -c "pip install uv jupyterlab && jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token='' --NotebookApp.password=''"

  fastapi:
    build: .
    container_name: fastapi_container
    working_dir: /app
    volumes:
      - shared_models:/app/models
    ports:
      - "8989:8989"
    depends_on:
      - jupyterlab
    environment:
      - PORT=8989
    command: >
      bash -c "cp -r /app/models_backup/* /app/models/ && pip install fastapi uvicorn && pip install -r requirements.txt && uvicorn app.fastapi_penguins:app --host 0.0.0.0 --port 8989"

volumes:
  shared_models:
```

---

## 📊 Entrenamiento y Actualización de Modelos  

1️⃣ Accede a **JupyterLab** en 👉 [http://localhost:8888/lab](http://localhost:8888/lab)  
2️⃣ Entrena el modelo y **guárdalo en `/workspace/models/`**  
3️⃣ **FastAPI accederá al modelo actualizado sin necesidad de reconstruir el contenedor.**

---

## 📝 Uso de la API  

### 🔹 Ejemplo de Petición `POST` a `/predict`
```bash
curl -X POST "http://localhost:8989/predict" -H "Content-Type: application/json" -d '{
  "island": "Torgersen",
  "culmen_length_mm": 50.0,
  "culmen_depth_mm": 15.0,
  "flipper_length_mm": 200.0,
  "body_mass_g": 4000.0,
  "sex": "MALE",
  "model": "decision_tree"
}'
```

### 🔹 Respuesta Esperada:
```json
{
  "species_predicted": "Chinstrap"
}
```

---

## 👥 Desarrollado por:

🔹 **Andrés F Matallana**  
🔹 **Edwin A Caro**  
🔹 **Santiago Zafra Rodríguez** 🚀
