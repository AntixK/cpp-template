FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "Updating Ubuntu"
RUN apt-get update && apt-get upgrade -y

RUN echo "Installing dependencies..."
RUN apt install -y \
    build-essential\
    ccache \
    clang \
    clang-format \
    cppcheck \
    curl \
    doxygen \
    ffmpeg \
    gcc \
    git \
    libatlas3-base \
    libatlas-base-dev \
    libglib2.0-0 \
    libssl-dev \
    make \
    python3 \
    python3-pip \
    tar \
    tmux \
    unzip \
    vim \
    wget 

RUN echo "Installing additional packages from package-list.txt"
COPY package-list.txt /tmp/package-list.txt
RUN xargs apt-get install -y < /tmp/package-list.txt \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean
# RUN apt-get update && apt-get --ignore-missing install -y $(cat /tmp/package-list.txt)

RUN echo "Installing CMake, Catch2 & Valgrind"

RUN wget https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3.tar.gz && \
    tar -zxvf cmake-3.26.3.tar.gz && \
    cd cmake-3.26.3 && \
    ./bootstrap && \
    make -j3 && \
    make install 

RUN git clone https://github.com/catchorg/Catch2.git && \
    cd Catch2 && \
    cmake -Bbuild -H. -DBUILD_TESTING=OFF && \
    cmake --build build/ --target install

RUN wget https://sourceware.org/pub/valgrind/valgrind-3.21.0.tar.bz2 && \
    tar -xvf valgrind-3.21.0.tar.bz2 && \
    cd valgrind-3.21.0 && \
    ./configure && \
    make -j3 && \
    make install

RUN ln -sv /usr/bin/python3 /usr/bin/python

WORKDIR "/home"
RUN echo "Done"

