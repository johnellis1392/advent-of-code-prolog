:- module('2018/day01', []).

:- use_module(library(dcg/basics), [integer/3]).
:- use_module(library(clpfd)).
:- use_module('../../aoc').
:- use_module('../../util/set').
:- set_prolog_flag(double_quotes, chars).

aoc:parse('2018/day01', Input, ParsedInput) :-
  atom_chars(Input, ParsedInput).

freq, [N] --> [N0], [S], integer(I),
  {S = '+', N #= N0 + I ; S = '-', N #= N0 - I}.

sep, [N] --> [N], (", " ; "\n").
eos, [N] --> [N], ("\n", [] ; []).

part1_ --> freq, (eos ; sep, part1_).

aoc:part1('2018/day01', Input, Output) :-
  phrase(part1_, [0|Input], [Output]).

freq2(I) --> "+", integer(N), {I #= N, !}.
freq2(I) --> "-", integer(N), {I #= -N, !}.
parse_([I|Is]) --> freq2(I), (", " ; "\n"), !, parse_(Is).
parse_([I]) --> freq2(I), ("\n", [] ; []), !.
parse_([]) --> ("\n", [] ; []), !.

scan_(_, _, V, N, N) :- _ = V.get(N), !.
scan_(Orig, [], V, Sum, N) :- !, scan_(Orig, Orig, V, Sum, N).
scan_(Orig, [H|T], V, Sum, N) :-
  NextSum #= Sum + H,
  scan_(Orig, T, V.insert(Sum), NextSum, N).

aoc:part2('2018/day01', Input, Output) :-
  phrase(parse_(I), Input),
  scan_(I, I, set{}, 0, Output).
