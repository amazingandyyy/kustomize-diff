FROM golang:1.17 AS builder
COPY . .
RUN go build -o /bin/action ./cmd/main.go

FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /bin/action /bin/action

ENTRYPOINT ["/bin/action"]
