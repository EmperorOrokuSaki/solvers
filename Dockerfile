# Start with an Ubuntu base image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3-pip \
    build-essential \
    wget \
    unzip \
    autoconf \
    software-properties-common \
    libffi-dev \
    cmake \
    python3.10-venv \
    python3 python3-setuptools \
    python3-wheel ninja-build 

# Install Yices
RUN add-apt-repository ppa:sri-csl/formal-methods -y && apt-get update && apt-get install -y yices2

RUN pip3 install --user meson

RUN git config --global http.postBuffer 1048576000  # Set buffer to 1GB

# Disable HTTP/2 for Git
RUN git config --global http.version HTTP/1.1


RUN git clone https://github.com/cvc5/cvc5.git && cd cvc5 && ./configure.sh --auto-download && \
    cd ./build && \
    make && \
    make check && \
    make install 


# Install Bitwuzla
RUN git clone https://github.com/bitwuzla/bitwuzla && \
    cd bitwuzla && \
    ./configure.py && \
    cd build && \
    ninja install

# Upgrade pip and install Python dependencies
RUN pip3 install --upgrade pip && \
    pip3 install pytest setuptools wheel z3-solver==4.12.2.0

# Set the default command for the container
CMD ["bash"]

