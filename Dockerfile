FROM golang:1.19beta1-alpine3.15


ENV CGO_ENABLED=0

RUN mkdir /app

ADD . /app

WORKDIR /app

COPY go.mod go.mod ./



RUN go mod tidy

RUN go test ./...
 
RUN go build -o k8s


LABEL author="This image created by Ali {alideveloper95@gmail.com}. This image is the demonstration of k8s"

CMD ["/app/k8s"]
