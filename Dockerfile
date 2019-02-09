# TODO https://docs.opencv.org/3.4/d4/da1/tutorial_js_setup.html
FROM python:3.5.6-alpine3.8

RUN apk update \
    && apk upgrade \
    && apk add bash \
    && rm -rf /var/cache/*/* \
    && echo "" > /root/.ash_history \
    && apk add --no-cache zsh git cmake clang clang-dev make gcc g++ libc-dev linux-headers \
    && rm -f /tmp/* /etc/apk/cache/*

RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

ENV SHELL /bin/zsh

WORKDIR /app

RUN git clone https://github.com/emscripten-core/emsdk.git \
    && cd emsdk \
    && ./emsdk install latest \
    && ./emsdk activate latest \
    && zsh emsdk_env.sh \
    && cd ../

RUN git clone https://github.com/opencv/opencv.git \
    && python ./opencv/platforms/js/build_js.py build_js --emscripten_dir=./emsdk \
    && python ./opencv/platforms/js/build_js.py build_js --build_test

