# File: 	Makefile
# Purpose:	automatic generation of fonts
# Author:	Torben Hoffmann, based on work by Piet Tutelaers

SHELL = /bin/sh

MFSKAKBASE= mf/skakbrikker.mf mf/skakbase.mf mf/skakinf.mf 
SKAKMACROS= skak10.600pk skak15.600pk skak20.600pk skak30.600pk skakf10.600pk skakf10b.600pk tex/skak.sty

TEXINPUTS=tex/:mf/:

.SUFFIXES: .dvi .ps .600gf .600pk

all: fonts doc 

doc: doc/skakdoc.pdf doc/tuggame.pdf doc/refman.pdf doc/informator.pdf fonts

fonts: skak10.600pk skak15.600pk skak20.600pk skak30.600pk skakf10.600pk skakf10b.600pk 

doc/%.pdf:	doc/%.tex ${SKAKMACROS} 
	latexmk -silent -pdfdvi -outdir=doc $<

.600gf.600pk:
	gftopk $<

skak10.tfm skak10.600gf: mf/skak10.mf $(MFSKAKBASE) 
	(mf "\mode:=localfont; input mf/skak10")

skak15.tfm skak15.600gf: mf/skak15.mf $(MFSKAKBASE) 
	(mf "\mode:=localfont; input mf/skak15")

skak20.tfm skak20.600gf: mf/skak20.mf $(MFSKAKBASE) 
	(mf "\mode:=localfont; input mf/skak20")

skak30.tfm skak30.600gf: mf/skak30.mf $(MFSKAKBASE) 
	(mf "\mode:=localfont; input mf/skak30")

skakf10.tfm skakf10.600gf: mf/skakf10.mf $(MFSKAKBASE) 
	(mf "\mode:=localfont; input mf/skakf10")

# bold versions of the figurine notation fonts
skakf10b.tfm skakf10b.600gf: mf/skakf10b.mf $(MFSKAKBASE) 
	(mf "\mode:=localfont; input mf/skakf10b")


clean:
	rm -f *gf *pk *.ps *.dvi *.aux *.log *.tfm *.mf *.fd *.sty *.toc
	rm -f test/*.dvi test/*.log test/*.aux
	rm -f doc/*.dvi doc/*.aux doc/*.toc doc/*latexmk doc/*.fls doc/*.log doc/*flymake* doc/*.fen doc/*.tmp
	rm -f *latexmk *.fls

ctan: tex/skak.sty tex/*.tex tex/*.fd mf/*.mf doc
	ctanify --pkgname=skak tex/skak.sty tex/*.tex tex/*.fd mf/*.mf doc/*.pdf README THANKS LICENSE ChangeLog.md special.map test/*.tex

