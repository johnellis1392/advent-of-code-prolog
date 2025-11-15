:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2015/day01').
:- use_module('../../test_utils').

:- begin_tests('2015/day01', [setup(nb_setval(tag, '2015/day01')), cleanup(nb_delete(tag))]).

test(part1, [O =:= 3]) :- run_part1('(((', O).
test(part1, [O =:= -3]) :- run_part1(')))', O).
test(part1, [O =:= 0]) :- run_part1('()()()', O).
test(part1, [O =:= 1]) :- run_part1('((())', O).

test(part2, [O =:= 7]) :- run_part2('((())))', O).

:- end_tests('2015/day01').
