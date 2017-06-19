#!/bin/bash

while true; do
    inotifywait --quiet --recursive --event create,close_write ${VAR_WATCH}
    supervisorctl restart program
done