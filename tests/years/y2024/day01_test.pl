:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2024/day01').
:- use_module('../../test_utils').

:- begin_tests('2024/day01', [setup(nb_setval(tag, '2024/day01')), cleanup(nb_delete(tag))]).

input('3   4\n4   3\n2   5\n1   3\n3   9\n3   3\n').

test(parse, [O == [[3, 4, 2, 1, 3, 3], [4, 3, 5, 3, 9, 3]]]) :- input(I), run_parse(I, O).

test(part1, [O =:= 11]) :- input(I), run_part1(I, O).

test(part2, [O =:= 31]) :- input(I), run_part2(I, O).

:- end_tests('2024/day01').
