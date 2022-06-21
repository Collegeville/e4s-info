prefix ?= /usr/local/bin/
mandir ?= /usr/local/share

install:
	
	echo
	echo "PATH for command will be set to: $(prefix)"
	echo "MANPATH for the manual page will be set to: $(mandir)/man/man1/"
	echo

	mkdir -p $(prefix)
	
	[ -d $(prefix) ] || (echo "Problems making directory $(prefix). Either use sudo before command if permission was denied, check target directory, or check for other sources of possible error." && echo && exit 3)

	echo "Created prefix directory or directory already exists"
	echo

	
	cp -r e4s-info-command/ $(prefix)

	echo "Successfully copied files"

	mkdir -p "$(mandir)/man/man1/"

	[ -d "$(mandir)/man/man1/" ] || (echo "Problems making directory "$(mandir)/man/man1/". Either use sudo before command if permission was denied, check target directory, or check for other sources of possible error." && echo && exit 3)

	echo "Created mandir directory or directory already exists"

	cp e4s-info-manual/e4s-info.1.gz "$(mandir)/man/man1/"
	
	echo "Successfully copied file"

	echo

	echo 'export PATH=$$PATH:$(prefix)/e4s-info-command/'
	echo 'export MANPATH=$$MANPATH:$(mandir)/man/'

	touch install

clean:
	rm install
