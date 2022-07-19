#!/bin/bash

/systpl/systpl.jinja.py /systpl/supervisor.conf.tmpl > /etc/supervisor.conf
/systpl/systpl.jinja.py /systpl/newrelic.ini.tmpl > /etc/php/7.4/mods-available/newrelic.ini

exec supervisord -c /etc/supervisor.conf
