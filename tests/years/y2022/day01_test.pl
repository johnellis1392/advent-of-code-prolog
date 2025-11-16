:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2022/day01').
:- use_module('../../test_utils').

:- begin_tests('2022/day01', [setup(nb_setval(tag, '2022/day01')), cleanup(nb_delete(tag))]).

:- set_prolog_flag(double_quotes, chars).
input('1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000\n').

test(parse, [O == [[1000, 2000, 3000], [4000], [5000, 6000], [7000, 8000, 9000], [10000]]]) :-
  input(I),
  run_parse(I, O).

test(part1, [O =:= 24000]) :- input(I), run_part1(I, O).

test(part2, [O =:= 45000]) :- input(I), run_part2(I, O).

:- end_tests('2022/day01').
