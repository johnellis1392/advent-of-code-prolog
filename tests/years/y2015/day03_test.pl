:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2015/day03').
:- use_module('../../test_utils').

:- set_prolog_flag(double_quotes, chars).

:- begin_tests('2015/day03', [setup(nb_setval(tag, '2015/day03')), cleanup(nb_delete(tag))]).

test(parse, [O == ['^', '>', 'v', '<']]) :- run_parse("^>v<", O).

test(part1, [O =:= 2]) :- run_part1('>', O).
test(part1, [O =:= 4]) :- run_part1('^>v<', O).
test(part1, [O =:= 2]) :- run_part1('^v^v^v^v^v', O).

test(part2, [O =:= 3]) :- run_part2("^v", O).
test(part2, [O =:= 3]) :- run_part2("^>v<", O).
test(part2, [O =:= 11]) :- run_part2("^v^v^v^v^v", O).

:- end_tests('2015/day03').
