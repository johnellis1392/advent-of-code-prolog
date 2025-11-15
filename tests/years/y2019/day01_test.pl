:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2019/day01').
:- use_module('../../test_utils').

:- begin_tests('2019/day01', [setup(nb_setval(tag, '2019/day01')), cleanup(nb_delete(tag))]).

test(parse, [O == [12]]) :- run_parse('12', O).
test(parse, [O == [14]]) :- run_parse('14', O).
test(parse, [O == [12, 14]]) :- run_parse('12\n14', O).

test(part1, [O =:= 2]) :- run_part1('12', O).
test(part1, [O =:= 2]) :- run_part1('14', O).
test(part1, [O =:= 654]) :- run_part1('1969', O).
test(part1, [O =:= 33583]) :- run_part1('100756', O).
test(part1, [O =:= 4]) :- run_part1('12\n14', O).

test(part2, [O =:= 2]) :- run_part2('14', O).
test(part2, [O =:= 966]) :- run_part2('1969', O).
test(part2, [O =:= 50346]) :- run_part2('100756', O).

:- end_tests('2019/day01').
