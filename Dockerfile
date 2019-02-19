FROM turbulent/heap-app:4.0.0
ENV heap-daemon 1.0.0

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install pkg-config php7.1-dev libevent-dev && \
  pecl install event && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

ADD supervisor.conf.tmpl /systpl/

ADD openssl-req.conf.tmpl /systpl/
ADD nginx/nginx.conf.tmpl /systpl
ADD nginx/nginx.app.conf.tmpl /systpl

ADD run-program.sh /
ADD run-watcher.sh /
ADD run-nginx.sh /

ADD event.ini /etc/php/7.1/mods-available/
RUN ln -sf /etc/php/7.1/mods-available/event.ini /etc/php/7.1/cli/conf.d/21-event.ini

COPY run.sh /

ENV VAR_COMMAND="unset-program.php" \
  VAR_WATCH="" \
  VAR_SSL="1" \
  VAR_SSL_PEM="" \
  VAR_SSL_PORT="8443" \
  VAR_SSL_SERVER_NAME="dev.local" \
  VAR_NGINX_WORKER_PROCESSES="4" \
  VAR_NGINX_WORKER_CONNECTIONS="66536" \
  VAR_NGINX_SERVER_ALIASES="[]" \
  VAR_NGINX_GZIP="true" \
  VAR_NGINX_LOADBALANCER_IPS="127.0.0.1" \
  VAR_NGINX_LOADBALANCER_HEADER="X-Forwarded-For" \
  VAR_NGINX_MAX_BODY_SIZE="1500M" \
  VAR_NGINX_PROXY_READ_TIMEOUT="86400" \
  VAR_NGINX_PROXY_SEND_TIMEOUT="86400" \
  VAR_NGINX_EXTRACONF=""
