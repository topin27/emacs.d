.PHONY: all

all:
	cd site-lisp; git submodule update --init

compile:
	cd site-lisp/evil; make compile
	cd site-lisp/evil-surround; make compile
	cd site-lisp/company; make compile
	cd site-lisp/markdown-mode; make
