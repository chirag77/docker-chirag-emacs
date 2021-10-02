FROM alpine:3.11

MAINTAINER Iku Iwasa "iku.iwasa@gmail.com"

RUN apk update && apk add ca-certificates emacs

RUN apk add --no-cache sqlite~=3.32.1-r0

RUN apk --update add gcc make g++ zlib-dev

WORKDIR /root

COPY init.el /root/.emacs.d/
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "emacs" ]
