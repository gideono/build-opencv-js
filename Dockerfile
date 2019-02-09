# TODO https://docs.opencv.org/3.4/d4/da1/tutorial_js_setup.html
FROM python:3.5.6-alpine3.8

RUN apk update \
    && apk upgrade \
    && apk add bash \
    && rm -rf /var/cache/*/* \
    && echo "" > /root/.ash_history \
    && apk add --no-cache bash git cmake clang clang-dev make gcc g++ libc-dev linux-headers

# change default shell from ash to bash
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

WORKDIR /app

RUN git clone https://github.com/emscripten-core/emsdk.git \
    && cd emsdk \
    && ./emsdk install latest \
    && ./emsdk activate latest \
#    && ./emsdk_env.sh \
    && cd ../

RUN git clone https://github.com/opencv/opencv.git \
    && python ./opencv/platforms/js/build_js.py build_js \
    && python ./opencv/platforms/js/build_js.py build_js --build_test

