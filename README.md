# heap-daemon docker image.

Image for running a long-lived PHP process, usually using evented I/O via
[ReactPHP](http://reactphp.org/).

This image is based upon the heap-app Docker image.

## Usage

```
$ docker run -d heap-daemon
```

You can pass envrionment variables when launching the container:

```
$ docker run -d -e "VAR_COMMAND=/vol/website/bin/daemon.php" heap-daemon
```

## Environment variables

This image uses environment variables to override common configuration options.

At the very least, you should specify `VAR_PROGRAM` as the path to the PHP
daemon program.

If you set `VAR_WATCH` to a valid directory within the container, the PHP
daemon will be automatically restarted whenever a file in this directory
changes (through inotify events).

The following environment variables are available (listed below with default values):

```
VAR_COMMAND="unset-program.php"
VAR_WATCH=""
```

### SSL/Proxy

This image includes an optional SSL proxy to use if your main daemon or program needs to terminate SSL to run.

```
VAR_SSL="1"
VAR_SSL_PEM=""
VAR_SSL_PORT="8443"
VAR_SSL_SERVER_NAME="dev.local"
VAR_NGINX_WORKER_PROCESSES="4"
VAR_NGINX_WORKER_CONNECTIONS="66536"
VAR_NGINX_SERVER_ALIASES="[]"
VAR_NGINX_GZIP="true"
VAR_NGINX_LOADBALANCER_IPS="127.0.0.1"
VAR_NGINX_LOADBALANCER_HEADER="X-Forwarded-For"
VAR_NGINX_MAX_BODY_SIZE="1500M"
VAR_NGINX_PROXY_READ_TIMEOUT="86400"
VAR_NGINX_PROXY_SEND_TIMEOUT="86400"
VAR_NGINX_EXTRACONF=""
```

## License

All work found under this repository is licensed under the [Apache
License 2.0](LICENSE).
