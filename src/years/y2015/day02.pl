:- module(day02, [min/2, max/2, surface_area/2, slack/2, ribbon_length/2, bow_length/2]).

:- use_module(library(dcg/basics), [integer/3, eos/2, string/3]).
:- use_module('../../aoc').

:- set_prolog_flag(double_quotes, chars).

eol --> "\n", !.
eol --> "\r\n", !.
eol --> eos.

parse_line([H, W, D]) --> integer(H), "x", integer(W), "x", integer(D).

parser([]) --> call(eos), !.
parser([[H, W, D]|Rest]) --> parse_line([H, W, D]), eol, parser(Rest).

aoc:parse('2015/day02', Input, ParsedInput) :-
  (
    string(Input) -> string_chars(Input, C)
  ; atom(Input) -> atom_chars(Input, C)
  ; C = Input
  ),
  phrase(parser(ParsedInput), C).

min_([], Min, Min) :- !.
min_([H|T], Min, X) :-
  H >= Min, !,
  min_(T, Min, X).
min_([H|T], Min, X) :-
  H < Min, !,
  min_(T, H, X).
min([H|T], X) :- min_(T, H, X), !.

max_([], Max, Max) :- !.
max_([H|T], Max, X) :-
  H =< Max, !,
  max_(T, Max, X).
max_([H|T], Max, X) :-
  H > Max, !,
  max_(T, H, X).
max([H|T], X) :- max_(T, H, X), !.

surface_area([H, W, D], A) :- A is 2 * H * W + 2 * H * D + 2 * W * D.

slack([H, W, D], S) :- 
  S1 is H * W, S2 is W * D, S3 is H * D,
  min([S1, S2, S3], S).

part1_([], Sum, Sum) :- !.
part1_([[H, W, D]|Rest], Sum, Output) :-
  surface_area([H, W, D], A),
  slack([H, W, D], S),
  NextSum is Sum + A + S,
  !, part1_(Rest, NextSum, Output).

aoc:part1('2015/day02', Input, Output) :-
  part1_(Input, 0, Output).

ribbon_length([H, W, D], L) :-
  (
    H < D, W < D -> X = H, Y = W
  ; H < W, D < W -> X = H, Y = D
  ; X = W, Y = D
  ),
  L is 2 * X + 2 * Y.
bow_length([H, W, D], L) :-
  L is H * W * D.

part2_([], Sum, Sum).
part2_([[H, W, D]|Rest], Sum, Output) :-
  ribbon_length([H, W, D], R),
  bow_length([H, W, D], B),
  NextSum is Sum + R + B,
  part2_(Rest, NextSum, Output).

aoc:part2('2015/day02', Input, Output) :-
  part2_(Input, 0, Output).
