FROM alpine:latest

ARG UID=1000
ARG GID=1000

SHELL [ "/bin/ash", "-eo", "pipefail", "-c" ]

RUN apk add --no-cache tini sudo su-exec util-linux git npm \
      && npm install -g gatsby-cli \
      && mkdir -p /apps \
      && addgroup -g $GID -S people \
      && adduser -u $UID -G people -S person -h /apps/sites \
      && echo 'person ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 8000 9000

USER person:people

ENTRYPOINT [ "/sbin/tini", "--", "/usr/local/bin/entrypoint.sh" ]
CMD [ "sleep", "infinity" ]

