#!/usr/bin/make -f

#SUBDIRS :=

all: install

install:
	mkdir -pv $(DESTDIR)
	cp -a usr $(DESTDIR)/.
	# remove some remaining files
	find $(DESTDIR) -type f -iname "*.in" | xargs rm -f
