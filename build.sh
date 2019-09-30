#!/usr/bin/env bash

docker build --build-arg RCON_PASSWORD=$1 --build-arg REVISION=$2 -t egdetti/bukkit:$2-alpine .
