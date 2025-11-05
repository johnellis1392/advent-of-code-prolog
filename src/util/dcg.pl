:- module(dcg, [eol/2]).

:- use_module(library(dcg/basics), [eos/2]).

eol --> "\n", !.
eol --> "\r\n", !.
eol --> eos.
