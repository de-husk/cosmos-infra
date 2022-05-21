# PR NOTE: We are storing the Dockerfiles here in this repo because Akash doesnt currently support k8s configmaps.
# Which makes it hard to have one general purpose Dockerfile that can be used by Akash and the main half-life project.
FROM golang:1.18.2-alpine3.15 AS go-builder

RUN apk add git

WORKDIR /code

# TODO: Im just doing this rn to test this out before these PRs are merged (point this back to strangelove-ventures)
RUN git clone https://github.com/Samangan/half-life.git .

RUN git checkout samangan/add-alertTypeSlashingSLA

RUN go build -o bin/half-life


FROM alpine:3.15

COPY --from=go-builder /code/bin/half-life /usr/bin/half-life

COPY run-half-life.sh /data/run-half-life.sh
COPY config.yaml /data/

WORKDIR /data

CMD ["./run-half-life.sh"]