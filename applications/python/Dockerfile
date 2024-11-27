FROM python:alpine3.19

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app.py .

EXPOSE 8082

CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8082"]



