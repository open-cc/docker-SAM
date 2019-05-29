FROM alpine:latest


RUN mkdir -p /opt/app

WORKDIR /opt/app

RUN apk update && \
    apk upgrade && \
    apk add git make gcc sdl-dev libc-dev

RUN git clone https://github.com/vidarh/SAM
RUN sed -i "1s/^/#define __GLIBC__ 0\n/" ./SAM/src/main.c

RUN cd SAM && make

ENTRYPOINT ["./SAM/sam", "${@}"]
