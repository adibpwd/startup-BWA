FROM golang:1.18.2

RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

WORKDIR /code

COPY /src /code


# RUN go get github.com/cosmtrek/air

# RUN go get github.com/canthefason/go-watcher

RUN go mod download && go mod verify

# CMD ["air"]

# RUN go get github.com/codegangsta/gin

# ENTRYPOINT [ "go/bin/watcher" ]