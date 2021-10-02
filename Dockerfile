FROM alpine:3.11

MAINTAINER Iku Iwasa "iku.iwasa@gmail.com"

RUN apk update && apk add ca-certificates emacs
RUN sudo apt-get -y update
RUN sudo apt-get -y upgrade
RUN sudo apt-get install -y sqlite3 libsqlite3-dev

WORKDIR /root

COPY init.el /root/.emacs.d/
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "emacs" ]
