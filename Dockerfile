FROM python:3.7

WORKDIR /app

RUN apt-get update && \
    apt-get install --no-install-recommends -y gcc  && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt

COPY main.py /app

CMD streamlit run main.py --server.port $PORT