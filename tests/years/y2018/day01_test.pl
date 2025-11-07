:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2018/day01').
:- use_module('../../test_utils').

:- begin_tests('2018/day01').

test('part1: "+1, -2, +3, +1" => 3') :- run(aoc:part1, '2018/day01', '+1, -2, +3, +1', 3).
test('part1: "+1, +1, +1" => 3') :- run(aoc:part1, '2018/day01', '+1, +1, +1', 3).
test('part1: "+1, +1, -2" => 0') :- run(aoc:part1, '2018/day01', '+1, +1, -2', 0).
test('part1: "-1, -2, -3" => -6') :- run(aoc:part1, '2018/day01', '-1, -2, -3', -6).

test('part1: "+1\n-2\n+3\n+1\n" => 3') :- run(aoc:part1, '2018/day01', '+1\n-2\n+3\n+1\n', 3).

test('part2: "+1, -2, +3, +1" => 2') :- run(aoc:part2, '2018/day01', '+1, -2, +3, +1', 2).
test('part2: "+1, -1" => 0') :- run(aoc:part2, '2018/day01', '+1, -1', 0).
test('part2: "+3, +3, +4, -2, -4" => 10') :- run(aoc:part2, '2018/day01', '+3, +3, +4, -2, -4', 10).
test('part2: "-6, +3, +8, +5, -6" => 2') :- run(aoc:part2, '2018/day01', '-6, +3, +8, +5, -6', 5).
test('part2: "+7, +7, -2, -7, -4" => 2') :- run(aoc:part2, '2018/day01', '+7, +7, -2, -7, -4', 14).

:- end_tests('2018/day01').
