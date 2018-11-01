#!/usr/bin/env bash
echo "Stopping containers ..."

docker stop $(docker ps -aq) &> /dev/null

echo "[OK]"