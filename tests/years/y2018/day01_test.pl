:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2018/day01').
:- use_module('../../test_utils').

:- begin_tests('2018/day01', [setup(nb_setval(tag, '2018/day01')), cleanup(nb_delete(tag))]).

test(part1, [O =:= 3]) :- run_part1('+1, -2, +3, +1', O).
test(part1, [O =:= 3]) :- run_part1('+1, +1, +1', O).
test(part1, [O =:= 0]) :- run_part1('+1, +1, -2', O).
test(part1, [O =:= -6]) :- run_part1('-1, -2, -3', O).
test(part1, [O =:= 3]) :- run_part1('+1\n-2\n+3\n+1\n', O).

test(part2, [O =:= 2]) :- run_part2('+1, -2, +3, +1', O).
test(part2, [O =:= 0]) :- run_part2('+1, -1', O).
test(part2, [O =:= 10]) :- run_part2('+3, +3, +4, -2, -4', O).
test(part2, [O =:= 5]) :- run_part2('-6, +3, +8, +5, -6', O).
test(part2, [O =:= 14]) :- run_part2('+7, +7, -2, -7, -4', O).

:- end_tests('2018/day01').
