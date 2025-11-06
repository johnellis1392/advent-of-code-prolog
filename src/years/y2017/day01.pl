:- module('2017/day01', []).

:- use_module('../../aoc').

aoc:parse('2017/day01', Input, ParsedInput) :-
  normalize_space(atom(I), Input),
  atom_chars(I, Chars),
  maplist([C, N]>>atom_number(C, N), Chars, ParsedInput).

chomp, [state(N, I)] --> [state(N0, I)], [I], { N is N0 + I }.
chomp, [state(N, I)] --> [state(N, C)], [I], { I \= C }.

part1_, [state(N, I)] --> [state(N, I)], ("\n", [] ; []).
part1_ --> chomp, part1_.

aoc:part1('2017/day01', Input, Output) :-
  [C|Numbers] = Input,
  phrase(part1_, [state(0, C)|Numbers], [state(O, L)]),
  ( C = L -> Output is O + C
  ; Output is O ).

halved(L, A, B) :-
  append(A, B, L),
  length(A, N),
  length(B, N), !.

count([], [], N, N).
count([I|As], [I|Bs], N, M) :- N1 is N + 2 * I, count(As, Bs, N1, M).
count([A|As], [B|Bs], N, M) :- A \= B, count(As, Bs, N, M).

aoc:part2('2017/day01', Input, Output) :-
  halved(Input, A, B),
  count(A, B, 0, Output).
