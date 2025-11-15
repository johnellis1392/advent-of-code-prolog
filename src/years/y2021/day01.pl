:- module('2021/day01', []).

:- use_module(library(dcg/basics), [integer/3]).
:- use_module('../../aoc').
:- set_prolog_flag(double_quotes, chars).

intseq([H|T]) --> integer(H), "\n", intseq(T).
intseq([H]) --> integer(H), [].
intseq([]) --> [].

aoc:parse('2021/day01', I, O) :-
  atom_chars(I, C),
  phrase(intseq(O), C), !.

part1_([A,B|T], S, O) :-
  A < B,
  S2 is S + 1,
  part1_([B|T], S2, O).
part1_([_|T], S, O) :- part1_(T, S, O).
part1_(_, O, O) :- !.

aoc:part1('2021/day01', I, O) :- part1_(I, 0, O).

part2_([A,B,C,D|T], S, O) :-
  X is A + B + C,
  Y is B + C + D,
  X < Y,
  S2 is S + 1,
  part2_([B,C,D|T], S2, O).
part2_([_|T], S, O) :- part2_(T, S, O).
part2_(_, O, O) :- !.

aoc:part2('2021/day01', I, O) :- part2_(I, 0, O).
