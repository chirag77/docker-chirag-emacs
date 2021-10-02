FROM alpine:3.11

MAINTAINER Iku Iwasa "iku.iwasa@gmail.com"

RUN apk update && apk add ca-certificates emacs sqlite3 libsqlite3-dev

WORKDIR /root

COPY init.el /root/.emacs.d/
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "emacs" ]
