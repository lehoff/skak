skak
====

This is a package for typesetting chess (skak in Danish) games in
LaTeX.

The basic idea is to allow the author to write about chess games using
normal chess notation, have that typeset nicely and then show the
position when desired. skak has an internal chess board so it is never
out of sync with the moves described in the text.

For more on the usage see the skakdoc.pdf file.


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


