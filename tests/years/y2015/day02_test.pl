:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2015/day02').
:- use_module('../../test_utils').

:- begin_tests('2015/day02', [setup(nb_setval(tag, '2015/day02')), cleanup(nb_delete(tag))]).

test(min, [O =:= 1]) :- min([1,2,3], O).
test(min, [O =:= 1]) :- min([3,2,1], O).

test(max, [O =:= 3]) :- max([1,2,3], O).
test(max, [O =:= 3]) :- max([3,2,1], O).

test(surface_area,  [O =:= 52]) :- surface_area([2, 3, 4], O).
test(surface_area,  [O =:= 42]) :- surface_area([1, 1, 10], O).

test(slack, [O =:= 6]) :- slack([2,3,4], O).
test(slack, [O =:= 1]) :- slack([1,1,10], O).

test(part1, [O =:= 58]) :- run_part1('2x3x4', O).
test(part1, [O =:= 43]) :- run_part1('1x1x10', O).
test(part1, [O =:= 101]) :- run_part1('2x3x4\n1x1x10', O).

test(ribbon_length, [O =:= 10]) :- ribbon_length([2, 3, 4], O).
test(ribbon_length, [O =:= 4]) :- ribbon_length([1, 1, 10], O).

test(bow_length, [O =:= 24]) :- bow_length([2, 3, 4], O).
test(bow_length, [O =:= 10]) :- bow_length([1, 1, 10], O).

test(part2, [O =:= 34]) :- run_part2("2x3x4", O).
test(part2, [O =:= 14]) :- run_part2("1x1x10", O).

:- end_tests('2015/day02').
