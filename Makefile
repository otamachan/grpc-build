VERSION:=1.14.1
DESTDIR=/usr/local

all: grpc
	make -C grpc

grpc:
	git clone -b v$(VERSION) https://github.com/grpc/grpc
	git -C grpc submodule init
	git -C grpc submodule update


install:
	mkdir -p $(DESTDIR)/lib
	make -C grpc/third_party/protobuf install
	mkdir -p $(DESTDIR)/include/grpc
	make -C grpc install prefix=$(DESTDIR)
	# https://github.com/grpc/grpc/pull/13500
	ln -sf libgrpc++_reflection.so.$(VERSION) $(DESTDIR)/lib/libgrpc++_reflection.so.1
	ln -sf libgrpc++.so.$(VERSION) $(DESTDIR)/lib/libgrpc++.so.1

clean:
	rm -rf grpc
