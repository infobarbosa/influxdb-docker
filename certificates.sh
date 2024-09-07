#!/bin/bash

# Remove os certificados existentes
rm -Rf assets/certificates/ssl/*

# gerando a chave privada da CA
openssl genrsa -out assets/certificates/ssl/influxdb-ca.key 2048

# Cria uma solicitação de assinatura de certificado (CSR) chamada "influxdb-ca.csr" usando a chave privada "influxdb-ca.key" e especificando detalhes do assunto para sua CA de teste.
openssl req -new -key assets/certificates/ssl/influxdb-ca.key -out assets/certificates/ssl/influxdb-ca.csr -subj "/C=BR/ST=SP/L=Sao Jose dos Campos/O=infobarbosa CA/CN=infobarbosa"

# Assina o CSR em "influxdb-ca.csr" para gerar um certificado raiz chamado "influxdb-ca.crt" usando a chave privada "influxdb-ca.key", com um período de validade de 365 dias.
openssl x509 -req -days 365 -signkey assets/certificates/ssl/influxdb-ca.key -in assets/certificates/ssl/influxdb-ca.csr -out assets/certificates/ssl/influxdb-ca.crt

# Cria uma chave privada chamada "influxdb.key" para o servidor influxdb.
openssl genrsa -out assets/certificates/ssl/influxdb.key 2048

# Cria uma solicitação de assinatura de certificado (CSR) chamada "influxdb.csr" usando a chave privada "influxdb.key" e especificando detalhes do assunto para o servidor influxdb-demo.
openssl req -new -key assets/certificates/ssl/influxdb.key -out assets/certificates/ssl/influxdb.csr -subj "/C=BR/ST=SP/L=Sao Jose dos Campos/O=infobarbosa/CN=influxdb-demo"

# Assina o CSR em "influxdb.csr" para gerar um certificado assinado pela CA chamado "influxdb.crt" usando a chave privada da CA "influxdb-ca.key", com um período de validade de 1825 dias (5 anos).
openssl x509 -req -days 1825 -CA assets/certificates/ssl/influxdb-ca.crt -CAkey assets/certificates/ssl/influxdb-ca.key -CAcreateserial -in assets/certificates/ssl/influxdb.csr -out assets/certificates/ssl/influxdb.crt
