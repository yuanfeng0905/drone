FROM docker.io/golang:alpine as builder

RUN apk add --update \
    make git build-base \
    && rm -fr /var/cache/apk/*

WORKDIR /go/src/github.com/drone/drone
COPY . .
RUN make server

FROM docker.io/alpine:latest 
WORKDIR /apps
COPY --from=builder /go/src/github.com/drone/drone/drone-server ./

CMD ["./drone-server"]