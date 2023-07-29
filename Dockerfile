FROM debian:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    qemu-utils \
    qemu-system-x86 \
    xauth

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
ENV RUSTUP_HOME="/root/.rustup"

WORKDIR /app

RUN rustup default nightly
RUN rustup target add x86_64-unknown-linux-gnu
RUN rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu
RUN rustup component add llvm-tools-preview --toolchain nightly-x86_64-unknown-linux-gnu
RUN cargo install bootimage
