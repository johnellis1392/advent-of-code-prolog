:- module('2020/day01', []).

:- use_module(library(dcg/basics), [integer/3]).
:- use_module('../../aoc').
:- set_prolog_flag(double_quotes, chars).

parser([H|T]) --> integer(H), "\n", parser(T).
parser([H]) --> integer(H), [].
parser([]) --> [].

aoc:parse('2020/day01', I, O) :-
  atom_chars(I, C),
  phrase(parser(O), C), !.

part1_([], _) :- fail.
part1_([A|T], O) :-
  member(B, T),
  2020 is A + B,
  O is A * B, !.
part1_([_|T], O) :- part1_(T, O).

aoc:part1('2020/day01', I, O) :-
  part1_(I, O).

part2_([], _) :- fail.
part2_([A|T], O) :-
  select(B, T, T2),
  member(C, T2),
  2020 is A + B + C,
  O is A * B * C, !.
part2_([_|T], O) :- part2_(T, O).

aoc:part2('2020/day01', I, O) :-
  part2_(I, O).
