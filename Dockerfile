FROM golang:1.17
RUN go build -o /bin/app ./cmd/main.go
ENTRYPOINT ["/bin/app"]
