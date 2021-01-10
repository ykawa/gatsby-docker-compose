#!/bin/sh -e
set -o pipefail

if [ -z "$@" ]; then
  echo "usage: `basename $0` site-name [starter-url]" 1>&2
  echo "  ex) `basename $0` blog https://github.com/andykenward/gatsby-starter-default-typescript" 1>&2
  exit 1
fi

if [ `id -u` -ne 0 ];then
  echo "ERROR: You need root privileges." 1>&2
  exit 2
fi

apk add --no-cache --virtual .builddepts autoconf automake libtool dpkg pkgconfig nasm libpng alpine-sdk

su-exec person:people gatsby new "$@"

apk del --purge .builddepts

