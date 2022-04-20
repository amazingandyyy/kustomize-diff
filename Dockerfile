FROM golang:1.17 AS builder

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=linux \
  GOARCH=amd64

RUN apt-get -qq update && \
  apt-get -yqq install upx

WORKDIR /src
COPY . .

RUN go build -o \
    /bin/action \
    cmd/main.go

RUN echo "nobody:x:65534:65534:Nobody:/:" > /etc_passwd

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc_passwd /etc/passwd
COPY --from=builder --chown=65534:0 /bin/action /bin/action

USER nobody
ENTRYPOINT ["/bin/action"]
