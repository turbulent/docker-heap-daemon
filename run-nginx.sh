#!/bin/bash

/systpl/systpl.jinja.py /systpl/openssl-req.conf.tmpl > /etc/nginx/openssl-req.conf
/systpl/systpl.jinja.py /systpl/nginx.conf.tmpl > /etc/nginx/nginx.conf
/systpl/systpl.jinja.py /systpl/nginx.app.conf.tmpl > /etc/nginx/nginx.app.conf

if [[ ! -z $VAR_SSL && ! -z $VAR_SSL_PEM ]]; then
  echo "Using supplied SSL PEM"
  echo "$VAR_SSL_PEM" > /etc/nginx/ssl.pem
  export VAR_SSL_PEM="***cleared***"
elif [[ ! -z $VAR_SSL ]]; then
  echo "Generating self-signed certificate : ${VAR_SSL_SERVER_NAME}..."
  openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl.pem \
    -out /etc/nginx/ssl.pem \
    -config /etc/nginx/openssl-req.conf
fi

echo "Starting nginx..."
exec /usr/sbin/nginx
