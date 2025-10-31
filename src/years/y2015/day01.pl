:- module(day01, []).

:- use_module('../../aoc').

aoc:parse('2015/day01', Input, Output) :- string_chars(Input, Output), !.

part1_([], Output, Output) :- !.
part1_(['('|T], N, Output) :-
  M is N + 1, part1_(T, M, Output).
part1_([')'|T], N, Output) :-
  M is N - 1, part1_(T, M, Output).
aoc:part1('2015/day01', Input, Output) :- part1_(Input, 0, Output), !.

part2_(_, -1, Index, Index) :- !.
part2_(['('|T], Floor, Index, Output) :-
  NextFloor is Floor + 1,
  NextIndex is Index + 1,
  part2_(T, NextFloor, NextIndex, Output).
part2_([')'|T], Floor, Index, Output) :-
  NextFloor is Floor - 1,
  NextIndex is Index + 1,
  part2_(T, NextFloor, NextIndex, Output).
aoc:part2('2015/day01', Input, Output) :- part2_(Input, 0, 0, Output), !.
