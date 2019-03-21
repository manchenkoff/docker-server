#!/bin/bash
service supervisor start

echo "Starting Apache..."
rm -f /var/run/apache2/apache2.pid
apache2ctl -k start -D FOREGROUND