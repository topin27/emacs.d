.PHONY: all compile

all:
	cd site-lisp; git submodule update --init

compile:
	cd site-lisp/evil; make compile
	cd site-lisp/evil-surround; make compile
	cd site-lisp/company-mode; make compile
	cd site-lisp/markdown-mode; make

clean:
	cd site-lisp/evil; make clean
	cd site-lisp/evil-surround; make clean
	cd site-lisp/company-mode/; make clean
	cd site-lisp/markdown-mode/; make clean
