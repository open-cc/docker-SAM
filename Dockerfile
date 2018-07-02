FROM alpine:latest

RUN mkdir -p /opt/app

WORKDIR /opt/app

RUN apk update && \
    apk upgrade && \
    apk add git make gcc sdl-dev libc-dev

RUN git clone https://github.com/vidarh/SAM

RUN cd SAM && make

ENTRYPOINT ["./SAM/sam", "${@}"]