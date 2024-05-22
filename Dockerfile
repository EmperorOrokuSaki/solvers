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
    libffi-dev

# Install Yices
RUN add-apt-repository ppa:sri-csl/formal-methods -y && apt-get update && apt-get install -y yices2

# Install Foundry
RUN curl -L https://foundry.paradigm.xyz | bash
RUN ~/.foundry/bin/foundryup

# Set up Python and Install Halmos dependencies
RUN pip3 install --upgrade pip
RUN pip3 install pytest setuptools wheel
RUN pip3 install z3-solver==4.12.2.0

# Add your application files
WORKDIR /app
COPY . /app

# Ensure Foundry binaries are in PATH
ENV PATH="/root/.foundry/bin:${PATH}"

# Install the package in editable mode within /app directory
RUN pip3 install -e /app

# Set the default command for the container
CMD ["bash"]
