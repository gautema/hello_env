FROM golang:alpine as builder
RUN apk add --no-cache git
COPY . $GOPATH/src/hello/
WORKDIR $GOPATH/src/hello/
RUN go get -d -v
RUN go build -o /go/bin/hello
FROM alpine
COPY --from=builder /go/bin/hello /go/bin/hello
ENTRYPOINT ["/go/bin/hello"]