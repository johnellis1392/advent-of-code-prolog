:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2015/day03').
:- use_module('../../test_utils').

:- set_prolog_flag(double_quotes, chars).

:- begin_tests(day03).

test('parse("^>v<") => [^, >, v, <]') :-
  day03:parse('2015/day03', "^>v<", ['^', '>', 'v', '<']).

test('part1: > => 2') :- run(aoc:part1, '2015/day03', ">", 2).
test('part1: ^>v< => 4') :- run(aoc:part1, '2015/day03', "^>v<", 4).
test('part1: ^v^v^v^v^v => 2') :- run(aoc:part1, '2015/day03', "^v^v^v^v^v", 2).

test('part2: ^v => 3') :- run(aoc:part2,  '2015/day03', "^v", 3).
test('part2: ^>v< => 3') :- run(aoc:part2,  '2015/day03', "^>v<", 3).
test('part2: ^v^v^v^v^v => 11') :- run(aoc:part2,  '2015/day03', "^v^v^v^v^v", 11).

:- end_tests(day03).
