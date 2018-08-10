# Project

Alpine Linux Docker image for Locust.

[![Docker Pulls](https://img.shields.io/docker/pulls/andreburgaud/locust.svg)](https://hub.docker.com/r/andreburgaud/locust/)
[![Docker Automated Build](https://img.shields.io/docker/automated/andreburgaud/locust.svg)](https://hub.docker.com/r/andreburgaud/locust/)
[![Docker Build Status](https://img.shields.io/docker/build/andreburgaud/locust.svg)](https://hub.docker.com/r/andreburgaud/locust/)
[![Layers](https://images.microbadger.com/badges/image/andreburgaud/locust.svg)](https://microbadger.com/images/andreburgaud/locust)
[![Version](https://images.microbadger.com/badges/version/andreburgaud/locust.svg)](https://microbadger.com/images/andreburgaud/locust)

# Locust

https://locust.io/

# Usage

```
docker run --rm -it -v `pwd`:/scenarios -p 8089:8089 andreburgaud/locust locust -f /scenarios/scenario.py --host=https://example.com
```

# Create Image

```
$ IMAGE_TAG=0.8.1 make build
```

# License

MIT License
