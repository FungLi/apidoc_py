#!/bin/bash

network_mode=$1

if [ ! $network_mode ]; then
 network_mode='--socket'
fi

uwsgi $network_mode :5001 --chdir /var/www/flask/ --module app --callable app --master --processes 4 --threads 2 --stats :5002
# wsgi --ini uwsgi --ini ${WEB_DIR}/config/uwsgi/conf.d/uwsgi.ini
