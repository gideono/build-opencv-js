#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

docker build -f "$SCRIPT_PATH/../Dockerfile" --rm -t build-opencv-js .