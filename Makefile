.PHONY: install uninstall clean build

PREFIX  ?= /usr
BINDIR  := $(PREFIX)/bin
DESTDIR ?=

install:
	install -d $(DESTDIR)$(BINDIR)
	install -m 0755 invariance-hash.sh $(DESTDIR)$(BINDIR)/invariance-hash
	install -d $(DESTDIR)$(PREFIX)/share/doc/invariance-hash
	install -m 0644 README.md $(DESTDIR)$(PREFIX)/share/doc/invariance-hash/README.md

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/invariance-hash
	rm -f $(DESTDIR)$(PREFIX)/share/doc/invariance-hash/README.md

clean:
	:

build:
	: