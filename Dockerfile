FROM python:3.9-slim 

EXPOSE 8000
RUN groupadd --gid 2000 app \
  && useradd --uid 2000 --gid app --shell /bin/bash --create-home app 

WORKDIR app

COPY requirements.txt requirements.txt ./
COPY app.py app.py

USER app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT ["python3"]

CMD ["app.py"]

