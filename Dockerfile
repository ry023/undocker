FROM golang:1.13

WORKDIR /undocker
RUN apt update -qqy && apt install -qqy bzr
RUN go get github.com/go-delve/delve/cmd/dlv
COPY go.mod .
COPY go.sum .
RUN go mod download
ADD . /undocker
CMD dlv debug ./cmd/undocker/ -- -r http://registry.hub.docker.com/ -u '' -p '' extract lolipopmc/php:7.3 /opt/xyz
