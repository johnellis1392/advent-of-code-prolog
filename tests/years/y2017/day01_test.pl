:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2017/day01').
:- use_module('../../test_utils').
:- set_prolog_flag(double_quotes, chars).

:- begin_tests('2017/day01', [setup(nb_setval(tag, '2017/day01')), cleanup(nb_delete(tag))]).

test(part1, [O =:= 3]) :- run_part1('1122', O).
test(part1, [O =:= 4]) :- run_part1('1111', O).
test(part1, [O =:= 0]) :- run_part1('1234', O).
test(part1, [O =:= 9]) :- run_part1('91212129', O).

test(part2, [O =:= 6]) :- run_part2('1212', O).
test(part2, [O =:= 0]) :- run_part2('1221', O).
test(part2, [O =:= 4]) :- run_part2('123425', O).
test(part2, [O =:= 12]) :- run_part2('123123', O).
test(part2, [O =:= 4]) :- run_part2('12131415', O).

:- end_tests('2017/day01').
