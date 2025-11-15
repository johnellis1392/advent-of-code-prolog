:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2016/day02').
:- use_module('../../test_utils').

:- begin_tests('2016/day02', [setup(b_setval(tag, '2016/day02')), cleanup(nb_delete(tag))]).

default_input(
'ULL
RRDDD
LURDL
UUUUD'
).

test(part1, [O == '1985']) :- default_input(I), run_part1(I, O).

test(part2, [O == '5DB3']) :- default_input(I), run_part2(I, O).

:- end_tests('2016/day02').
