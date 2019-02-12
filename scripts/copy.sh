#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

docker cp build-opencv-js:/app/build_js/bin ${SCRIPT_PATH}/../