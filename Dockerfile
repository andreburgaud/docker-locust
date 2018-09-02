FROM       python:3.7-alpine3.8

ARG        locust_version=0.9.0
ENV        LOCUST_VERSION=$locust_version

LABEL      locustio.version=$LOCUSTIO_VERSION
LABEL      python.version=$PYTHON_VERSION
LABEL      maintainer=andre.burgaud@gmail.com

RUN apk add --no-cache --virtual build-dependencies \
      gcc \
      g++ \
      libffi-dev \
      freetype-dev \
      libpng-dev \
      linux-headers \
      musl-dev \
      openssl-dev \
      python3-dev \
      zeromq-dev && \
    apk add --no-cache libzmq && \
    pip install --upgrade pip && \
    pip install locustio==$LOCUST_VERSION pyzmq==17.1.2 --no-cache-dir && \
    apk del build-dependencies

RUN mkdir /scenarios

WORKDIR /scenarios

EXPOSE 8089 5557 5558

CMD ["sh"]
