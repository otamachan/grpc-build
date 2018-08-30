VERSION:=1.14.1
DESTDIR=/usr

all: grpc
	make -C grpc

grpc:
	git clone -b v$(VERSION) https://github.com/grpc/grpc
	git -C grpc submodule init
	git -C grpc submodule update


install: all
	mkdir -p $(DESTDIR)/include/grpc
	make -C grpc install prefix=$(DESTDIR)
	cp grpc/third_party/protobuf/src/protoc $(DESTDIR)/bin

clean:
	rm -rf grpc
