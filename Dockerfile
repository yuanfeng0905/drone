FROM docker.io/alpine:latest

WORKDIR /apps
COPY drone-server .

CMD ["./drone-server"]