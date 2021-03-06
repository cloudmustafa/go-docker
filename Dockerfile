# We specify the base image we need for our

# go application

FROM golang:1.12.0-alpine3.9

RUN apk add git

# We create an /app directory within our

# image that will hold our application source

# files

RUN mkdir $GOPATH/src/app

# We copy everything in the root directory

# into our /app directory

ADD . $GOPATH/src/app

# We specify that we now wish to execute

# any further commands inside our /app

# directory

WORKDIR $GOPATH/src/app

# we run go build to compile the binary

# executable of our Go program

RUN go get ./...

RUN go build -o main .

# Our start command which kicks off

# our newly created binary executable
EXPOSE 9005
CMD ["./main"]



