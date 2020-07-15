FROM golang:1.14.4-alpine3.12 as build
WORKDIR /go/src/github.com/ing-bank/flink-deployer/
COPY . .
RUN go build ./cmd/cli

FROM alpine:3.12.0
WORKDIR /flink-deployer
COPY --from=build /go/src/github.com/ing-bank/flink-deployer/cli .
VOLUME [ "/data/flink" ]
ENTRYPOINT [ "/flink-deployer/cli" ]
CMD [ "help" ]
