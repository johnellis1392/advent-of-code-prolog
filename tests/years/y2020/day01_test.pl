:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2020/day01').
:- use_module('../../test_utils').

:- begin_tests('2020/day01', [setup(nb_setval(tag, '2020/day01')), cleanup(nb_delete(tag))]).

input('1721\n979\n366\n299\n675\n1456').

test(parse, [O == [1721, 979, 366, 299, 675, 1456]]) :- input(I), run_parse(I, O).

test(part1, [O =:= 514579]) :- input(I), run_part1(I, O).

test(part2, [O =:= 241861950]) :- input(I), run_part2(I, O).

:- end_tests('2020/day01').
