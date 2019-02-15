FROM python:2.7.15-slim-stretch

RUN apt update \
    && apt install git --assume-yes checkinstall \
    && apt install make --assume-yes \
    && apt install cmake --assume-yes

WORKDIR /app

RUN git clone https://github.com/emscripten-core/emsdk.git \
    && cd emsdk \
    && ./emsdk install latest \
    && ./emsdk activate latest \
    && bash emsdk_env.sh \
    && cd ../

RUN git clone https://github.com/opencv/opencv.git \
#    && python ./opencv/platforms/js/build_js.py build_wasm --build_wasm --emscripten_dir=./emsdk/emscripten/1.38.27
#    \
    && python ./opencv/platforms/js/build_js.py build_js --build_test --emscripten_dir=./emsdk/emscripten/1.38.27

