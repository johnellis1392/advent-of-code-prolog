:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2016/day01').
:- use_module('../../../src/util/set').
:- use_module('../../test_utils').

:- begin_tests('2016/day01', [setup(nb_setval(tag, '2016/day01')), cleanup(nb_delete(tag))]).

test(parse, [O == [inst(right, 2), inst(left, 3)]]) :- run_parse('R2, L3\n', O).

test(part1, [O =:= 5]) :- run_part1('R2, L3', O).
test(part1, [O =:= 2]) :- run_part1('R2, R2, R2', O).
test(part1, [O =:= 12]) :- run_part1('R5, L5, R5, R3', O).

test(part2, [O =:= 4]) :- run_part2('R8, R4, R4, R8', O).

:- end_tests('2016/day01').
