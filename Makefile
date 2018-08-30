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

clean:
	rm -rf grpc
