FROM golang:1.17-buster

RUN export GO111MODULE=on
ENV GO111MODULE=on

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . .

RUN go build -o /server

RUN useradd -m server
USER server

EXPOSE 8080

CMD ["/server"]
