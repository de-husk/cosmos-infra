FROM rust:latest as pd-build

RUN apt-get update && apt-get install -y build-essential pkg-config libssl-dev clang libclang-dev

RUN curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path --default-toolchain none -y
RUN rustup component add rustfmt

# Install pd
WORKDIR /penumbra

RUN git clone https://github.com/penumbra-zone/penumbra .

RUN git fetch && git checkout 022-hegemone

RUN cargo update

RUN cargo build --bin pd --release && \
    mkdir -p /out && \
    mv target/release/pd /out/pd

FROM tendermint/tendermint:v0.35.9 as tendermint-build


FROM debian:bullseye-slim as runtime

RUN apt update && apt install -y python3.9 libpython3.9-dev curl unzip

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1
RUN update-alternatives --set python /usr/bin/python3.9

# Install AWS cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip -d /usr/src && rm -f awscliv2.zip \
    && /usr/src/aws/install --bin-dir /usr/bin

# pd port
EXPOSE 26658

# tendermint p2p, rpc and prometheus port
EXPOSE 26656 26657 26660

WORKDIR /penumbra

COPY --from=tendermint-build /usr/bin/tendermint /usr/bin/tendermint
COPY --from=pd-build /out/pd /usr/bin/pd

ENV RUST_LOG=warn,pd=info,penumbra=info

COPY run.sh /usr/bin/

ENTRYPOINT [ "run.sh" ]