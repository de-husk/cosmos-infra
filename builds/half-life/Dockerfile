# PR NOTE: We are storing the Dockerfiles here in this repo because Akash doesnt currently support k8s configmaps.
# Which makes it hard to have one general purpose Dockerfile that can be used by Akash and the main half-life project.
FROM golang:1.18.2-alpine3.15 AS go-builder

RUN apk add git

WORKDIR /code

RUN git clone https://github.com/strangelove-ventures/half-life.git .

RUN git fetch

RUN go build -o bin/half-life


FROM alpine:3.15

COPY --from=go-builder /code/bin/half-life /usr/bin/half-life

COPY run-half-life.sh /data/run-half-life.sh
COPY config.yaml /data/

WORKDIR /data

CMD ["./run-half-life.sh"]