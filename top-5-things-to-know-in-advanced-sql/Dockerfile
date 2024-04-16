FROM python:3.9

WORKDIR /usr/src/sandbox

COPY ingest_data.py ingest_data.py

ENTRYPOINT ["python", "ingest_data.py"]

# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt

# CMD [ "python", "./your-daemon-or-script.py" ]