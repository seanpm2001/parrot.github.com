# ex: set ro:
# DO NOT EDIT THIS FILE
# Generated by Parrot::Configure::Compiler from config/gen/makefiles/docs.in

# Copyright (C) 2001-2010, Parrot Foundation.

# Setup of some commands
PERL    = /usr/bin/perl
CHMOD   = $(PERL) -MExtUtils::Command -e chmod
MKPATH  = $(PERL) -MExtUtils::Command -e mkpath
TOUCH   = $(PERL) -MExtUtils::Command -e touch
RM_F    = $(PERL) -MExtUtils::Command -e rm_f
RM_RF   = $(PERL) -MExtUtils::Command -e rm_rf
PERLDOC_BIN = /usr/bin/perldoc
VERSION = 3.10.0-devel

#
# Targets
#
# This is a listing of all targets, that are meant to be called by users
# Most of them are proxied in the root makefile parrot/Makefile
help :
	@echo ""
	@echo "Following targets are available:"
	@echo ""
	@echo "help             Generate this usage statement."
	@echo "                 This is the default target."
	@echo ""
	@echo "html             Generate html documentation"
	@echo "html-clean       Remove html documentation"
	@echo ""
	@echo "htmlhelp:        windows only, generate a .chm file."
	@echo "htmlhelp-clean:  Remove generated .chm"
	@echo ""
	@echo "pdf:             Generate a PDF from the html docs"
	@echo "pdf-clean:       Remove generated pdf"
	@echo ""
	@echo "   clean:        Invoke all clean targets"
	@echo ""

clean: htmlhelp-clean html-clean

html:
	$(PERL) -I../lib ../tools/docs/make_html_docs.pl --version=$(VERSION)
html-clean:
	$(RM_RF) html

# If you are missing the command 'pdflatex' then you have first to install a
# LaTeX distribution with it. For Windows and UNIX downloads are for example
# available from: http://miktex.org, http://tug.org/texlive or
# http://www.ctan.org
pdf: ../tools/docs/filename_and_chapter.pl
	$(MKPATH) build/modified_pod
	$(PERL) ../tools/docs/filename_and_chapter.pl
	cd build && pdflatex parrot-book.tex && pdflatex parrot-book.tex

#pdf-release: build/parrot-book.pdf
#	cp build/parrot-book.pdf build/parrot-book-$$(date +"%Y.%m").pdf

pdf-clean:
	$(RM_RF) build

htmlhelp: html

htmlhelp-clean:

# Local variables:
#   mode: makefile
# End:
# vim: ft=make:
