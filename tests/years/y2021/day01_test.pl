:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2021/day01').
:- use_module('../../test_utils').

:- begin_tests('2021/day01', [setup(nb_setval(tag, '2021/day01')), cleanup(nb_delete(tag))]).

input('199\n200\n208\n210\n200\n207\n240\n269\n260\n263').

test(parse, [O == [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]]) :-
  input(I), run_parse(I, O).

test(part1, [O =:= 7]) :- input(I), run_part1(I, O).

test(part2, [O =:= 5]) :- input(I), run_part2(I, O).

:- end_tests('2021/day01').
