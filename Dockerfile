FROM       python:3.7-alpine3.8

ENV        LOCUSTIO_VERSION=0.8.1

LABEL      locustio.version=$LOCUSTIO_VERSION
LABEL      python.version=$PYTHON_VERSION

RUN apk --no-cache add --virtual build-dependencies \
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
      pip install --upgrade pip && \
      pip install locustio==$LOCUSTIO_VERSION pyzmq==17.1.0 --no-cache-dir && \
      apk del build-dependencies

RUN mkdir /scenarios

WORKDIR /scenarios

EXPOSE 8089 5557 5558

CMD ["sh"]