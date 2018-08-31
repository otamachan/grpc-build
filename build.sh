#!/bin/sh
set -xe
VERSION=${VERSION:=1.14.1}
echo VERSION=${VERSION}
SUDO=
if [ "$(id -u)" != "0" ]; then
    SUDO=sudo
fi
make VERSION=${VERSION}
ARCH=amd64
$SUDO checkinstall \
    -y \
    --install=no \
    --maintainer=otamachan@gmail.com \
    --arch=${ARCH} \
    --pkgname=grpc \
    --pkgversion=$VERSION \
    --pkglicense=Apache2 \
    --requires="" \
    --deldesc=yes \
    --backup=no make install VERSION=${VERSION}
rm -rf description* doc-pak
dpkg -c *.deb
if [ -n "${OUTPUT}" ]; then
    cp *.deb ${OUTPUT}
fi
ls ${OUTPUT}
