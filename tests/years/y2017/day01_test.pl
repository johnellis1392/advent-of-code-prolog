:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2017/day01').
:- use_module('../../test_utils').
:- set_prolog_flag(double_quotes, chars).

:- begin_tests('2017/day01').

test('part1: 1122 => 3') :- run(aoc:part1, '2017/day01', '1122', 3).
test('part1: 1111 => 4') :- run(aoc:part1, '2017/day01', '1111', 4).
test('part1: 1234 => 0') :- run(aoc:part1, '2017/day01', '1234', 0).
test('part1: 91212129 => 9') :- run(aoc:part1, '2017/day01', '91212129', 9).

test('part2: 1212 => 6') :- run(aoc:part2, '2017/day01', '1212', 6).
test('part2: 1221 => 0') :- run(aoc:part2, '2017/day01', '1221', 0).
test('part2: 123425 => 4') :- run(aoc:part2, '2017/day01', '123425', 4).
test('part2: 123123 => 12') :- run(aoc:part2, '2017/day01', '123123', 12).
test('part2: 12131415 => 4') :- run(aoc:part2, '2017/day01', '12131415', 4).

:- end_tests('2017/day01').
