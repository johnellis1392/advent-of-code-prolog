:- module(day03, []).

:- use_module('../../aoc').

:- set_prolog_flag(double_quotes, chars).

aoc:parse('2015/day03', Input, ParsedInput) :- string_chars(Input, ParsedInput).

part1_([], _, Visited, O) :- list_to_set(Visited, S), length(S, O), !.
part1_([C|T], [X, Y], Visited, O) :-
  (
    C = '^' -> X2 is X, Y2 is Y - 1
  ; C = 'v' -> X2 is X, Y2 is Y + 1
  ; C = '>' -> X2 is X + 1, Y2 is Y
  ; X2 is X - 1, Y2 is Y
  ),
  part1_(T, [X2, Y2], [[X2, Y2]|Visited], O).

aoc:part1('2015/day03', Input, Output) :-
  part1_(Input, [0, 0], [[0, 0]], Output).

part2_([], _, Visited, O) :- list_to_set(Visited, S), length(S, O), !.
part2_([C|T], [[X, Y], [RX, RY]], Visited, O) :-
  (
    C = '^' -> X2 is X, Y2 is Y - 1
  ; C = 'v' -> X2 is X, Y2 is Y + 1
  ; C = '>' -> X2 is X + 1, Y2 is Y
  ; C = '<' -> X2 is X - 1, Y2 is Y
  ),
  part2_(T, [[RX, RY], [X2, Y2]], [[X2, Y2]|Visited], O).

aoc:part2('2015/day03', Input, Output) :-
  part2_(Input, [[0, 0], [0, 0]], [[0, 0]], Output).
