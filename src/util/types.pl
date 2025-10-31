:- module(types, [type_of/2]).

type_of(X, unbound_variable) :- var(X).
type_of(X, atom) :- atom(X).
type_of(X, integer) :- integer(X).
type_of(X, float) :- float(X).
type_of(X, compound) :- compound(X).
type_of(X, atom) :- atomic(X).
% type_of(X, list) :- is_list(X).
