#!/usr/bin/env bash
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

docker run -it --name build-opencv-js build-opencv-js /bin/sh