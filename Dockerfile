FROM python:2.7.15-slim-stretch

RUN apt update \
    && apt install git --assume-yes checkinstall \
    && apt-get install make --assume-yes \
    && apt-get install cmake --assume-yes

WORKDIR /app

RUN git clone https://github.com/emscripten-core/emsdk.git \
    && cd emsdk \
    && ./emsdk install latest \
    && ./emsdk activate latest \
    && bash emsdk_env.sh \
    && cd ../

RUN git clone https://github.com/opencv/opencv.git \
    && python ./opencv/platforms/js/build_js.py build_js --emscripten_dir=./emsdk/emscripten/1.38.26  --build_test

