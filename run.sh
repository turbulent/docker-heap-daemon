#!/bin/bash

/systpl/systpl.jinja.py /systpl/supervisor.conf.tmpl > /etc/supervisor.conf

exec supervisord -c /etc/supervisor.conf
