#!/usr/bin/env bash
directory=$(pwd);

current_directory=${directory##*/}
current_directory=${current_directory//.}

container=${current_directory}"_webserver_1";

cmd="docker exec -it $container bash"

echo "Starting SSH session ..."

eval ${cmd};