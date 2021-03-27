FROM golang:1.16.2-alpine3.13 AS build_go

WORKDIR /app
COPY main.go main.go
RUN CGO_ENABLED=0 GOOS=linux go build -a -o ease.exec main.go

FROM alpine:3.12.4

COPY --from=build_go /app/ease.exec ease.exec
EXPOSE 8000

CMD ["./ease.exec"]
