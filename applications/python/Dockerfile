FROM python:alpine3.19@sha256:8287ca207e905649e9f399b5f91a119e5e9051d8cd110d5f8c3b4bd9458ebd1d

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app.py .

EXPOSE 8082

CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8082"]



