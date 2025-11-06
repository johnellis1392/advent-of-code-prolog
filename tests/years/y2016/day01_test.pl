:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2016/day01').
:- use_module('../../../src/util/set').
:- use_module('../../test_utils').

:- begin_tests('2016/day01').

test('parse: R2, L3') :-
  Tag = '2016/day01',
  Input = 'R2, L3\n',
  Expected = [inst(right, 2), inst(left, 3)],
  '2016/day01':parse(Tag, Input, Actual),
  (
    Expected = Actual, !
  ; format('Expected ~w, but got ~w~n', [Expected, Actual]), fail
  ).

test('R2, L3 => 5') :- run(aoc:part1, '2016/day01', 'R2, L3', 5).
test('R2, R2, R2 => 2') :- run(aoc:part1, '2016/day01', 'R2, R2, R2', 2).
test('R5, L5, R5, R3 => 12') :- run(aoc:part1, '2016/day01', 'R5, L5, R5, R3', 12).

test('part2: R8, R4, R4, R8 => 4') :- run(aoc:part2, '2016/day01', 'R8, R4, R4, R8', 4).

:- end_tests('2016/day01').
