FROM golang:alpine AS build
ADD . /src
WORKDIR /src
RUN apk add git && go build -o goapp

FROM alpine
WORKDIR /app
COPY --from=build /src/goapp /app/
ENTRYPOINT ./goapp