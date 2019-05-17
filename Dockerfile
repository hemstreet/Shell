FROM alpine
MAINTAINER hemstreet

RUN apk add --no-cache emacs

ENV TERM xterm-256color

CMD ["emacs"]