
all: download

download:
ifeq ($(shell dpkg --print-architecture),amd64)
	uscan --download --watchfile debian/watch.amd64 --download-current-version --destdir . --no-symlink
	tar -jxvf firefox-*.tar.bz2 -C opt
	mv opt/firefox opt/firefox-bin
	rm -f firefox-*.tar.bz2
else ifeq ($(shell dpkg --print-architecture),i386)
	uscan --download --watchfile debian/watch.i386 --download-current-version --destdir . --no-symlink
	tar -jxvf firefox-*.tar.bz2 -C opt
	mv opt/firefox opt/firefox-bin
	rm -f firefox-*.tar.bz2
else "architecture not specified, try for example i686 or x86_64\n"
endif

clean:
	rm -f firefox-*
	rm -rf opt/firefox
	rm -rf opt/firefox-bin

install:

	mkdir -pv $(DESTDIR)
	cp -a opt usr $(DESTDIR)/.

.PHONY: download clean
