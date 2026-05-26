# syntax=docker/dockerfile:1

FROM ubuntu:latest

COPY --chmod=0755 pedidos.sh .

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

CMD ["/pedidos.sh"]
