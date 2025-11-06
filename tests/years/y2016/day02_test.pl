:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2016/day02').
:- use_module('../../test_utils').

:- begin_tests('2016/day02').

default_input(
'ULL
RRDDD
LURDL
UUUUD'
).

test('part1 should return 1985') :-
  default_input(I),
  run(aoc:part1, '2016/day02', I, '1985').

test('part2 should return 5DB3') :-
  default_input(I),
  run(aoc:part2, '2016/day02', I, '5DB3').

:- end_tests('2016/day02').
