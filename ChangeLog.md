Version 1.5.3
-------------

* cosmetic fixes:
  - rename makefile to Makefile.
  - updated version numbers correctly.

Version 1.5.2
-------------

* Removed lambda.sty from the skak distribution.

Version 1.5.1
-------------

* Created repo at github.com/lehoff/skak for all furture work on skak.

* Fixed a bug with longmoves for Kings where the from square was not
  correct due to a problem in DoTheMove. Thanks to Ulirch Dirr and
  Niels Stargardt for finding this bug.

* Fixed a bug on \lastmove when using \styleC. Thanks to Ulrich Dirr
  to come up with a rough solution that I have improved to take into
  account if styleC is being used or not.

* Added a ChangeLog.md file and removed the duplicate change history
  from tex/skak.sty

* Moved things from readme.txt into README.md and removed the change
  history from that.

* Added a LICENSE file.

* Added a THANKS file and removed the acknowledgements from
  skakdoc.tex.



Version 1.5
-----------

* Fixed a serioous problem with longmoves, in particular the algebraic notation. Thanks to Jernej Cop for describing the bug.

* As part of the longmoves fix the commands \variationcurrent, \continuevariation and \continuevariationcurrent has been introduced to make writing about variations from the mainline eaiser.

* Documented weird behaviours of \showallbut and \showonly. Thanks to Frank Mittelbach for pointing that out.

* Documented that \showmover requires loading skak with the ps option. Thanks to Christian H. Kuhn.

Version 1.4
----------- 
* Ulrike Fischer has created an easy access to new fonts. It is decribed in 
  the "Using chessfonts with skak.sty" document - ask her for the
  location of the document..
 
* A new command \showallbut has been in- troduced by request from
  Ulrike Fischer , it has the opposite effect to showonly, i.e., all
  pieces except those listed are showed in when showing the board.

* The engine has been rewritten so now it is possible to define
  typesetting using algebraic notation derived from the moves given in
  SAN notation. It is also posible to typeset e.p. after en passant moves
  if one care to define that.
 
* The documentation has been restructured and rewritten:
  - The readme.txt file has been created to keep track of the change history
    and the whis-list.
  - The skakdoc.tex file has been totally rewritten; hopefully to the better.

* A SourceForge project for skak has been created: latex-skak. The hope and 
  intention is to start a community for the skak package in addition to better
  reporting of bugs.

Version 1.3
----------- 
* Dirk Baechle has reworked the typesetting of chess moves:
   - A new capture symbol has been introduced to make the spacing
     around it better.

  - The figurine symbols have been improved so that the spacing around 
    them are more uniform - it looks really good now, at least to my eyes.
  - A proposal for what syntax the skak package should handle in the
    future has been included in the distribution.
  - The Informator symbols \novelty", \comment" and \various" needed
    another pair of curly braces in order to work right within the
   \mainline" and \variation" environments.
  - The check for trailing spaces in the macro \typeset@cmoves" had to
    be removed because it led to problems at the end of a \mainline"
    or \variation" environment when an additional Informator symbol
    was involved.
 
* A reference to the pgn2ltx tool created by Dirk Bachle has been
  added to the document.
 
* A reference to an URL decribing the PGN standard has been added.
 
Version 1.2
-----------
 
* Dirk Baechle has - once again - done a great job:
  - the informator symbols have been improved and now scale as they
    should (I have in the same go done some Metafont clean-up associated
    with the symbols).
  - he has also discovered that the selection of other fonts for the
    typesetting of moves can be done by redefining the \skakfamily
    command!
  - added the \movecomment for flexible typesetting of comments -
    see the Reference Manual for details.
  - The PostScript file are now 10 times smaller (for large files) and
    a comprehensive test of the PostScript ornaments has been created.
 
* All dead code has been removed from skak.sty.
 
Version 1.1
----------- 

* Dirk Baechle 's enhancements have been incorporated:
  - extension of the \highlight command; it now accepts X, x, O and
    o as optional arguments a cross and a circle on the square, respectively, 
    instead of a frame around the square.  
  - unwanted generation of spaces removed.
  - a set of Informator symbols were added to the fonts and made
    available through commands documented in the informator.ps file.
 
* Two fixes by Ulrike Fischer have been incorporated:
  - a bug in \ParseCoordinates.  
  - a problem in the fonts regarding size.
 
* Ulrike Fischer reported a problem with opening spaces causing the
  input to be ignored - this has been fixed and test/test2.tex
  verifies this.

Version 1.0 
----------- 

The major novelty in this release is that the documentation has been
updated and a reference manual has been created.



Future Additions/Wish-list
==========================
 
Choosing Language for mainline
------------------------------ 
(Proposal date: mid 2002.) 

It would be nice if one could choose the language for the mainline,
variation and \hidemoves for each invocation as it allows for easier
inclusion of analysis from chess programs when using a non-english
language.
 
 
Optimisation of the Implementation
----------------------------------
(Proposal date: 2-Jan-2003.) 

I would like to improve some areas of the im-
plementation since they are unnecessary slow
and/or complicated, e.g., \IsPieceName could
easily be implemented as a case statement in-
stead of a list look-up. I have a strong feeling
that this would be a lot faster than the current
implementation which has a very functional pro-
gramming flavour --- this was very helpful during
the development, but it has a tendency to be a
bit inefficient. 


Test Suite
----------
(Proposal date: 03-Jan-2003.) 
It would be a very good idea to create a test
suite created using normal testing techniques.
Areas of test should include:
 
* resolving ambiguous moves, i.e., ensuring 
that moves like Rad1 moves the right rook.
 
* all legal SAN moves are accepted.


