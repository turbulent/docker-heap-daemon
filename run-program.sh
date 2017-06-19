#!/bin/bash

/systpl/systpl.jinja.py /systpl/cli-php.ini.tmpl > /etc/php/7.1/cli/php.ini
/systpl/systpl.jinja.py /systpl/apc.ini.tmpl > /etc/php/7.1/mods-available/apcu.ini
/systpl/systpl.jinja.py /systpl/opcache.ini.tmpl > /etc/php/7.1/mods-available/opcache.ini

exec su heap -c "/usr/bin/php -q ${VAR_COMMAND}"
