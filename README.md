# heap-ratchet docker image.

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

## License

All work found under this repository is licensed under the [Apache
License 2.0](LICENSE).

