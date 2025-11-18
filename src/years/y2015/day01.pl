:- module(day01, []).

:- use_module(library(dcg/basics), [eos/2]).
:- use_module('../../aoc').
:- set_prolog_flag(double_quotes, chars).


aoc:parse('2015/day01', Input, Output) :- atom_chars(Input, Output), !.

% V1
% 7,000 inferences, 0.001 CPU in 0.001 seconds (98% CPU, 9308511 Lips)
part1_([], Output, Output) :- !.
part1_(['('|T], N, Output) :-
  M is N + 1, part1_(T, M, Output).
part1_([')'|T], N, Output) :-
  M is N - 1, part1_(T, M, Output).

% 14,007 inferences, 0.011 CPU in 0.018 seconds (63% CPU, 1266341 Lips)
% part1_(I) --> "(", part1_(J), {I is J + 1}.
% part1_(I) --> ")", part1_(J), {I is J - 1}.
% part1_(0) --> eos.

% 155,780 inferences, 0.064 CPU in 0.076 seconds (84% CPU, 2446371 Lips)
% part1_(I, O) :-
%   maplist([X, Y]>>(X == '(' -> Y = 1 ; Y = -1), I, Z),
%   sum_list(Z, O).

aoc:part1('2015/day01', Input, Output) :- part1_(Input, 0, Output).

% 1,796 inferences, 0.001 CPU in 0.001 seconds (57% CPU, 2599132 Lips)
part2_(_, -1, Index, Index) :- !.
part2_(['('|T], Floor, Index, Output) :-
  NextFloor is Floor + 1,
  NextIndex is Index + 1,
  part2_(T, NextFloor, NextIndex, Output).
part2_([')'|T], Floor, Index, Output) :-
  NextFloor is Floor - 1,
  NextIndex is Index + 1,
  part2_(T, NextFloor, NextIndex, Output).

aoc:part2('2015/day01', Input, Output) :-
  time(part2_(Input, 0, 0, Output)),
  !.
