:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2015/day01').
:- use_module('../../test_utils').

:- begin_tests(day01).

test('part1("(((") = 3') :- run(aoc:part1, '2015/day01', '(((', 3).
test('part1(")))") = -3') :- run(aoc:part1, '2015/day01', ')))', -3).
test('part1("()()()") = 0') :- run(aoc:part1, '2015/day01', '()()()', 0).
test('part1("((())") = 1') :- run(aoc:part1, '2015/day01', '((())', 1).

test('part2("((())))") = 7') :- run(aoc:part2, '2015/day01', '((())))', 7).

:- end_tests(day01).
