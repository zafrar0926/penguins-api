# 🐧 Penguin Species Prediction API

Este proyecto es una API construida con **FastAPI** y desplegada en **Render**, que permite predecir la especie de un pingüino a partir de sus características morfológicas utilizando modelos de Machine Learning.

## 🚀 Tecnologías Utilizadas

- **FastAPI** (para construir la API)
- **Uvicorn** (servidor ASGI)
- **Scikit-learn** (para los modelos de ML)
- **Joblib** (para cargar los modelos entrenados)
- **Docker** (para contenedorización y despliegue)
- **Render** (para hosting de la API)

## 📂 Estructura del Proyecto

```
📁 penguin_project
│-- 📁 static/            # Archivos estáticos (index.html, CSS, JS)
│-- 📁 models/            # Modelos entrenados (.pkl)
│-- 📄 app.fastapi_penguins.py  # Código de la API en FastAPI
│-- 📄 Dockerfile         # Configuración del contenedor Docker
│-- 📄 requirements.txt   # Dependencias del proyecto
│-- 📄 README.md          # Este archivo
```

## 🛠️ Instalación y Ejecución Local

### **1️⃣ Clonar el Repositorio**
```sh
git clone https://github.com/zafrar09/penguins-api.git
cd penguins-api
```

### **3️⃣ Instalar Dependencias**
```sh
pip install -r requirements.txt
```

### **4️⃣ Ejecutar la API en Local**
```sh
uvicorn app.fastapi_penguins:app --reload
```

La API estará disponible en: 👉 [http://localhost:8989](http://localhost:8989)

## 🐳 Uso con Docker

### **1️⃣ Construir la Imagen Docker**
```sh
docker build -t penguin_api .
```

### **2️⃣ Ejecutar el Contenedor**
```sh
docker run -p 8989:8989 --name penguin_container penguin_api
```

## 🌍 Uso en Render (Producción)

La API está desplegada en Render y accesible en:  
👉 **[https://penguins-api.onrender.com](https://penguins-api.onrender.com)**

### **Ejemplo de Petición `POST` a `/predict`**
```sh
curl -X POST "https://penguins-api.onrender.com/predict" -H "Content-Type: application/json" -d '{
  "island": "Torgersen",
  "culmen_length_mm": 50.0,
  "culmen_depth_mm": 15.0,
  "flipper_length_mm": 200.0,
  "body_mass_g": 4000.0,
  "sex": "MALE",
  "model": "decision_tree"
}'
```

### **Respuesta Esperada**
```json
{
  "species_predicted": "Chinstrap"
}
```
📌 **Desarrollado por:** Andrés F Matallana. Edwin A Caro. Santiago Zafra Rodríguez 🚀
