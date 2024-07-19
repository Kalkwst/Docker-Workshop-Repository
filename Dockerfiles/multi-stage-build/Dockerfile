FROM golang:latest AS builder

WORKDIR /app
COPY hellodocker.go .
RUN go build -o hello hellodocker.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello .
ENTRYPOINT ["./hello"]