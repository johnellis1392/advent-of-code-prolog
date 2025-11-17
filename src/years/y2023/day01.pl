:- module('2023/day01', [code/2, filter_map/3, code_parser/3]).

:- use_module(library(dcg/basics), [digit/3, eos/2]).
:- use_module('../../util/lists', [filter_map/3]).
:- use_module('../../util/strings', [lines/2, trim/2]).
:- use_module('../../aoc').
:- set_prolog_flag(double_quotes, chars).

aoc:parse('2023/day01', I, O) :- trim(I, C), lines(C, O).

code(S, O) :-
  filter_map(atom_number, S, C),
  append([A], _, C),
  append(_, [B], C),
  !, O is A * 10 + B.

aoc:part1('2023/day01', I, O) :-
  maplist([A, B]>>code(A, B), I, X),
  sum_list(X, O).

one, "ne" --> "one".
two, "wo" --> "two".
three, "hree" --> "three".
four, "our" --> "four".
five, "ive" --> "five".
six, "ix" --> "six".
seven, "even" --> "seven".
eight, "ight" --> "eight".
nine, "ine" --> "nine".

code_parser([H|T]) --> digit(D), !, code_parser(T), { number_chars(H, [D]) }.
code_parser([1|T]) --> one, !, code_parser(T).
code_parser([2|T]) --> two, !, code_parser(T).
code_parser([3|T]) --> three, !, code_parser(T).
code_parser([4|T]) --> four, !, code_parser(T).
code_parser([5|T]) --> five, !, code_parser(T).
code_parser([6|T]) --> six, !, code_parser(T).
code_parser([7|T]) --> seven, !, code_parser(T).
code_parser([8|T]) --> eight, !, code_parser(T).
code_parser([9|T]) --> nine, !, code_parser(T).
code_parser(T) --> [_], !, code_parser(T).
code_parser([]) --> !, eos.

codes(I, O) :-
  phrase(code_parser(A), I),
  append([H], _, A),
  append(_, [T], A),
  O is H * 10 + T.

aoc:part2('2023/day01', I, O) :-
  maplist([A, B]>>codes(A, B), I, X),
  sum_list(X, O).
