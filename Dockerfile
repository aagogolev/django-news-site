FROM python:3.10.4-slim-bullseye

RUN apt update && \
    apt install -y --no-install-recommends libpq-dev nginx-full libjpeg-dev zlib1g-dev supervisor gcc musl-dev wget && \
    rm -rf /var/lib/apt/lists/*

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code
COPY mysite/requirements.txt /code/
RUN python3 -m pip install -r requirements.txt --no-cache-dir
COPY mysite /code/

RUN chmod +x /code/entry.sh
ENTRYPOINT [ "/code/entry.sh" ]


