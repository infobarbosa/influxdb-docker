# syntax=docker/dockerfile:1

FROM ubuntu:latest

COPY --chmod=0755 pedidos.sh .
COPY --chmod=0644 ./assets/certificates/ssl/influxdb-ca.crt /etc/ssl/influxdb-ca.crt
COPY --chmod=0644 ./assets/certificates/ssl/influxdb-ca.crt /usr/local/share/ca-certificates/influxdb-ca.crt
COPY --chmod=0644 ./assets/certificates/ssl/influxdb.crt /etc/ssl/influxdb.crt

RUN apt-get update 
RUN apt install -y curl
RUN update-ca-certificates

CMD ["/pedidos.sh"]
