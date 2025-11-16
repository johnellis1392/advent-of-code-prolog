:- module('2022/day01', []).

:- use_module(library(lists), [sum_list/2]).
:- use_module('../../util/dcg', [intseq/4, sep_by/5]).
:- use_module('../../util/strings', [trim/2]).
:- use_module('../../aoc').
:- set_prolog_flag(double_quotes, chars).


aoc:parse('2022/day01', I, O) :-
  trim(I, S),
  atom_chars(S, C),
  phrase(sep_by(intseq("\n"), "\n\n", O), C).

part1_([], O, O) :- !.
part1_([H|T], Max, O) :-
  sum_list(H, S),
  NewMax is max(Max, S),
  part1_(T, NewMax, O).

aoc:part1('2022/day01', I, O) :-
  part1_(I, 0, O).

aoc:part2('2022/day01', I, O) :-
  maplist([X, Y]>>sum_list(X, Y), I, Ys),
  sort(Ys, S),
  append(_, [A,B,C], S),
  O is A + B + C.
