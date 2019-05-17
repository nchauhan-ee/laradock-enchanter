#!/bin/bash

openssl req \
    -newkey rsa:2048 \
    -x509 \
    -nodes \
    -keyout key.pem \
    -new \
    -out cert.pem \
    -subj "/C=IN/ST=Karnataka/O=Enchanting Travels/CN=et.dev" \
    -reqexts SAN \
    -extensions SAN \
    -config <(cat /System/Library/OpenSSL/openssl.cnf \
    <(printf '[SAN]\nsubjectAltName=DNS:et.dev,DNS:jw.et.dev,DNS:auth.et.dev,DNS:ratesv2.et.dev,DNS:fpm.et.dev,DNS:old.et.dev,DNS:enchanter.et.dev,DNS:la.et.dev,DNS:es.et.dev,DNS:mdm.et.dev,DNS:mdm-spa.et.dev,DNS:mdm-api.et.dev')) \
    -sha256 \
    -days 3650
