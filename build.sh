#!/bin/sh
set -xe
VERSION=${VERSION:=1.14.1}
echo VERSION=${VERSION}
make VERSION=${VERSION}
ARCH=amd64
checkinstall \
    -y \
    --install=no \
    --fstrans=yes \
    --maintainer=otamachan@gmail.com \
    --arch=${ARCH} \
    --pkgname=grpc \
    --pkgversion=$VERSION \
    --pkglicense=Apache2 \
    --requires="" \
    --deldesc=yes \
    --backup=no make install VERSION=${VERSION}
rm -rf description* doc-pak
if [ -n "${OUTPUT}" ]; then
    cp *.deb ${OUTPUT}
fi
ls ${OUTPUT}
