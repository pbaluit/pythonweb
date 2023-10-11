FROM python:3.9-slim-buster
LABEL Name="Python Flask Demo App" Version=1.4.2
LABEL org.opencontainers.image.source = "https://github.com/pbaluit/pythonapp.git"
RUN apt-get update && apt-get install -y git
ARG srcDir=src
RUN mkdir /app
WORKDIR /app
COPY $srcDir/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY $srcDir/run.py .
COPY $srcDir/app ./app
EXPOSE 5050
CMD ["gunicorn", "-b", "0.0.0.0:5050", "run:app"]

