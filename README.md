# instant-ai-deploy

[![CI Status](https://github.com/AUTOM77/Docker-instant-ai/workflows/build/badge.svg)](https://github.com/AUTOM77/Docker-instant-ai/actions?query=workflow:build)
[![CI Status](https://github.com/AUTOM77/Docker-instant-ai/workflows/verify/badge.svg)](https://github.com/AUTOM77/Docker-instant-ai/actions?query=workflow:verify)
[![Docker Pulls](https://flat.badgen.net/docker/pulls/monius/docker-instant-ai)](https://hub.docker.com/r/monius/docker-instant-ai)
[![Code Size](https://img.shields.io/github/languages/code-size/AUTOM77/Docker-instant-ai)](https://github.com/AUTOM77/Docker-instant-ai)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Open Issues](https://img.shields.io/github/issues/AUTOM77/Docker-instant-ai)](https://github.com/AUTOM77/Docker-instant-ai/issues)

> AI Infra on Multi-platform: `linux/amd64`, `linux/arm64`, `linux/arm`, `linux/s390x` and `linux/ppc64le`;

🚧 Building .. 🚧

Run
```sh
# AI_SERVICE_IP="10.88.0.1"
AI_SERVICE_HOST="host.containers.internal"

doas podman run --restart=always -itd \
    --name instant-ai \
    -e DOMAIN=$DOMAIN \
    -e CF_Token=$CF_Token \
    -e CF_Zone_ID=$CF_Zone_ID \
    -e CF_Account_ID=$CF_Account_ID \
    -e AI_SERVICE_NAME=$AI_SERVICE_NAME \
    -e AI_SERVICE_HOST="$AI_SERVICE_HOST" \
    -e AI_SERVICE_PORT=$AI_SERVICE_PORT \
    -p 80:80 \
    -p 443:443 \
    -v /etc/ssl/$DOMAIN:/etc/nginx/ssl:rw \
    monius/docker-instant-ai
```

Test
```sh
doas podman run --name ii -p 80:80 -p 443:443 -itd monius/docker-instant-ai
doas podman run --name ii -itd monius/docker-instant-ai
```

```bash
doas podman run --rm monius/docker-instant-ai 
doas podman run --name ii -it monius/docker-instant-ai /bin/sh
doas podman run --name ii -p 80:80 -p 443:443 -it monius/docker-instant-ai /bin/sh

doas podman run -itd \
    --name instant-ai \
    -e DOMAIN=domain \
    -e CF_Token=cf_api_token \
    -e CF_Zone_ID=cf_zone_id \
    -e CF_Account_ID=cf_acc_id \
    -e AI_SERVICE_NAME=ai_name \
    -e AI_SERVICE_PORT=ai_port \
    -p 80:80 \
    -p 443:443 \
    monius/docker-instant-ai

doas podman logs ii
doas podman inspect -f '{{.NetworkSettings.IPAddress}}' ii
doas podman rm -f $(doas podman ps -a -q) 
doas podman rmi -f $(doas podman images -a -q)
```

Reference

> 1. https://www.nginx.com/blog/inside-nginx-how-we-designed-for-performance-scale
> 2. https://kisspeter.github.io/fastapi-performance-optimization/nginx_port_socket.html
> 3. https://gist.github.com/3052776
