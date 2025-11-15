:- module('2019/day01', []).
:- set_prolog_flag(double_quotes, chars).

:- use_module(library(dcg/basics), [integer/3]).
:- use_module('../../aoc').

parser([H|T]) --> integer(H), "\n", parser(T).
parser([H]) --> integer(H), [], !.
parser([]) --> [], !.

aoc:parse('2019/day01', I, O) :-
  atom_chars(I, II),
  phrase(parser(O), II), !.

fuel(N, F) :- F is (N // 3) - 2.

part1_([], O, O) :- !.
part1_([H|T], S, O) :-
  fuel(H, F),
  S2 is S + F,
  part1_(T, S2, O).

aoc:part1('2019/day01', I, O) :-
  part1_(I, 0, O).

fuel_recursive(N, F) :-
  fuel(N, F0),
  (
    F0 =< 0 -> F = 0
  ; fuel_recursive(F0, F1), F is F0 + F1
  ).

part2_([], O, O) :- !.
part2_([H|T], S, O) :-
  fuel_recursive(H, F),
  S2 is S + F,
  part2_(T, S2, O).

aoc:part2('2019/day01', I, O) :- part2_(I, 0, O).
