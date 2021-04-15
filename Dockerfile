FROM golang:1.16.2-alpine3.13 AS build_go

WORKDIR /app
COPY main.go main.go
RUN CGO_ENABLED=0 GOOS=linux go build -a -o ease.exec main.go

# Create the user and group files that will be used in the running container to
# run the process as an unprivileged user.
RUN mkdir /user \
    && echo '1000:x:65534:65534:1000:/:' > /user/passwd \
    && echo '1000:x:65534:' > /user/group

FROM scratch

# Import the user and group files from the build stage.
COPY --from=build_go /user/group /user/passwd /etc/

COPY --from=build_go /app/ease.exec ease.exec

USER 1000

EXPOSE 8000

CMD ["./ease.exec"]
