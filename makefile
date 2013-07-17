# File: 	Makefile
# Purpose:	automatic generation of fonts
# Author:	Torben Hoffmann, based on work by Piet Tutelaers
# Version:	July 1999

SHELL = /bin/sh

# where should the .sty and .tfm files go?
TEXMFROOT=$(HOME)/Library/texmf
INPUTS=$(TEXMFROOT)/tex/latex/skak/
DESTPK=$(TEXMFROOT)/fonts/pk/public/skak/
DESTGF=$(TEXMFROOT)/fonts/gf/public/skak/
DESTTFM=$(TEXMFROOT)/fonts/tfm/public/skak/
DESTSOURCE=$(TEXMFROOT)/fonts/source/public/skak/
DESTDOC=$(TEXMFROOT)/doc/latex/skak/
MFSKAKBASE= mf/skakbrikker.mf mf/skakbase.mf mf/skakinf.mf 
SKAKMACROS= skak10.600pk skak15.600pk skak20.600pk skak30.600pk skakf10.600pk skakf10b.600pk tex/skak.sty tex/lambda.sty 

.SUFFIXES: .dvi .ps .600gf .600pk

all: fonts doc

doc: skakdoc.ps tuggame.ps refman.ps informator.ps

fonts: skak10.600pk skak15.600pk skak20.600pk skak30.600pk skakf10.600pk skakf10b.600pk 

skakbase: skakbrikker.mf skakbase.mf skakf10.mf skakf10b.mf skakinf.mf 

skakbrikker.mf: mf/skakbrikker.mf 
	(cp mf/skakbrikker.mf .)	

skakbase.mf: mf/skakbase.mf
	(cp mf/skakbase.mf .)	

skakf10.mf: mf/skakf10.mf
	(cp mf/skakf10.mf .)	

skakf10b.mf: mf/skakf10b.mf
	(cp mf/skakf10b.mf .)	

skakinf.mf: mf/skakinf.mf
	(cp mf/skakinf.mf .)	


skakdoc.dvi: doc/skakdoc.tex $(SKAKMACROS)
	(cp tex/*.sty .; \
	 latex "\batchmode\input doc/skakdoc.tex" \
	 latex "\batchmode\input doc/skakdoc.tex")

tuggame.dvi: doc/tuggame.tex $(SKAKMACROS) 
	(cp tex/*.sty .; \
	 latex "\batchmode\input doc/tuggame.tex" \
	 latex "\batchmode\input doc/tuggame.tex")

refman.dvi: doc/refman.tex $(SKAKMACROS) 
	(cp tex/*.sty .; \
	 latex "\batchmode\input doc/refman.tex" \
	 latex "\batchmode\input doc/refman.tex")

informator.dvi: doc/informator.tex $(SKAKMACROS) 
	(cp tex/*.sty .; \
	 latex "\batchmode\input doc/informator.tex" \
	 latex "\batchmode\input doc/informator.tex")


.dvi.ps : 
	dvips -o $@ $<

.600gf.600pk:
	gftopk $<

skak10.tfm skak10.600gf: mf/skak10.mf $(MFSKAKBASE) skakbase
	(mf "\mode:=localfont; input mf/skak10")

skak15.tfm skak15.600gf: mf/skak15.mf $(MFSKAKBASE) skakbase
	(mf "\mode:=localfont; input mf/skak15")

skak20.tfm skak20.600gf: mf/skak20.mf $(MFSKAKBASE) skakbase
	(mf "\mode:=localfont; input mf/skak20")

skak30.tfm skak30.600gf: mf/skak30.mf $(MFSKAKBASE) skakbase
	(mf "\mode:=localfont; input mf/skak30")

skakf10.tfm skakf10.600gf: mf/skakf10.mf $(MFSKAKBASE) skakbase
	(mf "\mode:=localfont; input mf/skakf10")

# bold versions of the figurine notation fonts
skakf10b.tfm skakf10b.600gf: mf/skakf10b.mf $(MFSKAKBASE) skakbase
	(mf "\mode:=localfont; input mf/skakf10b")

install: fonts doc
	install -d ${DESTPK}
	install -d ${DESTGF}
	install -d ${DESTTFM}
	install -d ${DESTSOURCE}
	install -d ${INPUTS}
	install -d ${DESTDOC}
	install   skak*.600pk $(DESTPK)
	install   skak*.600gf $(DESTGF)
	install   skak*.tfm   $(DESTTFM)
	install   mf/skak*.mf    $(DESTSOURCE)
	install   tex/skak.sty    $(INPUTS)
	install   tex/lambda.sty  $(INPUTS)
	install   *.ps            $(DESTDOC)
	@echo "Remember to run texhash!"
clean:
	rm -f *gf *pk *.ps *.dvi *.aux *.log *.tfm *.mf *.fd *.sty *.toc




