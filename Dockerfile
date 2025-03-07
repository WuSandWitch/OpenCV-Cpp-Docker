FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    build-essential cmake git pkg-config libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev \
    python3-dev python3-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev \
    libcanberra-gtk-module libcanberra-gtk3-module g++

# Clone OpenCV 並手動安裝
RUN git clone --branch 4.x --depth 1 https://github.com/opencv/opencv.git /opencv && \
    mkdir -p /opencv/build && cd /opencv/build && \
    cmake -D CMAKE_BUILD_TYPE=Release \
          -D CMAKE_INSTALL_PREFIX=/usr/local \
          -D OPENCV_GENERATE_PKGCONFIG=ON .. && \
    make -j"$(nproc)" && \
    make install && \
    rm -rf /opencv

ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

WORKDIR /app

COPY . /app

COPY compile.sh /app/compile.sh
RUN chmod +x /app/compile.sh

CMD ["/bin/bash"]
