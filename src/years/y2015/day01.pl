:- module(day01, [parse/2, part1/2, part1/3, part2/2, part2/4]).

parse(Input, Output) :- string_chars(Input, Output).

part1([], Output, Output).
part1(['('|T], N, Output) :-
  M is N + 1, part1(T, M, Output).
part1([')'|T], N, Output) :-
  M is N - 1, part1(T, M, Output).
part1(Input, Output) :- part1(Input, 0, Output).

part2(_, -1, Index, Index) :- !.
part2(['('|T], Floor, Index, Output) :-
  !,
  NextFloor is Floor + 1,
  NextIndex is Index + 1,
  part2(T, NextFloor, NextIndex, Output).
part2([')'|T], Floor, Index, Output) :-
  !,
  NextFloor is Floor - 1,
  NextIndex is Index + 1,
  part2(T, NextFloor, NextIndex, Output).
part2(Input, Output) :- part2(Input, 0, 0, Output).
