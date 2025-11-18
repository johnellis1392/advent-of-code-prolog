:- module('2024/day01', []).

:- use_module(library(occurs), [occurrences_of_term/3]).
:- use_module(library(dcg/basics), [integer/3, eos/2, whites/2]).
:- use_module('../../aoc').
:- set_prolog_flag(double_quotes, chars).


line(A, B) --> integer(A), whites, integer(B).
parser([A|AT], [B|BT]) --> line(A, B), parser_tail(AT, BT).
parser_tail([A|AT], [B|BT]) --> "\n", line(A, B), parser_tail(AT, BT).
parser_tail([], []) --> !, ("\n", eos ; eos).

aoc:parse('2024/day01', I, O) :-
  atom_chars(I, C),
  phrase(parser(A, B), C),
  O = [A, B].

part1_([], [], []) :- !, writeln('Done with part1_').
part1_([A|AT], [B|BT], [C|CT]) :-
  C is abs(A - B),
  part1_(AT, BT, CT).

aoc:part1('2024/day01', [A, B], O) :-
  sort(0, @=<, A, X), sort(0, @=<, B, Y),
  part1_(X, Y, Z),
  sum_list(Z, O).

% First attempt, using built-in libraries. Reported statistics:
% ?- time(part2_([A, B], O)).
% 4,061,708 inferences, 0.413 CPU in 0.427 seconds (97% CPU, 9829289 Lips)
% part2_([A, B], O) :-
%   maplist({B}/[X, Y]>>(occurrences_of_term(X, B, C), Y is X * C), A, N),
%   sum_list(N, O).

% Second attempt, much faster. Reported statistics:
% time(part2([A, B], O)).
% 31,582 inferences, 0.024 CPU in 0.027 seconds (90% CPU, 1306121 Lips)
count_occurrences([], O, O) :- !.
count_occurrences([H|T], M, O) :-
  ( N0 = M.get(H), N is N0 + 1, M2 = M.put(H, N)
  ; M2 = M.put(H, 1)),
  !,
  count_occurrences(T, M2, O).

part2_([A, B], O) :-
  count_occurrences(B, #{}, M),
  maplist({M}/[X, Y]>>(get_dict(X, M, N), Y is X * N ; Y = 0), A, C),
  sum_list(C, O).

aoc:part2('2024/day01', [A, B], O) :-
  part2_([A, B], O).
