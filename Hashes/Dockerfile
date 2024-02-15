ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim as base

WORKDIR /app

ENV ARGS ""

COPY . .

CMD python app.py ${ARGS}
