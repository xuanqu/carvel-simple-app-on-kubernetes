FROM golang:1.12
WORKDIR /go/src/github.com/xuanqu/carvel-simple-app-on-kubernetes/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -v -o app

FROM scratch
COPY --from=0 /go/src/github.com/xuanqu/carvel-simple-app-on-kubernetes/app .
EXPOSE 80
ENTRYPOINT ["/app"]
