FROM alpine:3.12

MAINTAINER Iku Iwasa "iku.iwasa@gmail.com"

RUN apk update && apk upgrade
RUN apk add ca-certificates emacs
RUN apk add gcc make g++ zlib-dev
RUN apk add --no-cache sqlite~=3.32.1-r0

WORKDIR /root

COPY init.el /root/.emacs.d/
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "emacs" ]
