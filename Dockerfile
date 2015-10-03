FROM debian:8
COPY . /tmp/seriesnext
RUN apt-get update && apt-get install -y make nodejs npm
WORKDIR /tmp/seriesnext
ENTRYPOINT make
