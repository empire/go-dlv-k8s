FROM golang:1.23 as builder

WORKDIR /app

RUN CGO_ENABLED=0 GOBIN=/app/ GOOS=linux go install github.com/go-delve/delve/cmd/dlv@v1.23.0

COPY go.mod main.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM alpine:3.17

WORKDIR /app

COPY --from=builder /app/main /app/main
COPY --from=builder /app/dlv /app/dlv

EXPOSE 8080
EXPOSE 8001

CMD ["/bin/sh", "-c", "/app/dlv --listen=0.0.0.0:8001 --headless=true --api-version=2 --only-same-user=false exec /app/main"]
