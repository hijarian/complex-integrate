complex-integrate
=================

Small and simple library for integration of complex functions.
Integrates functions along straight lines. Compatible with real-valued functions.
Uses Simpson's method.

As of Oct, 2011 I could not find any haskell package which could provide me with something so simple as this.

*cabalized*: install with

    $ cabal install complex-integrate

Provides you with only a single function:

    integrate f n a b

which integrates `f` along a line between points `a` and `b` while dividing this line in `n` segments, providing accuracy.

