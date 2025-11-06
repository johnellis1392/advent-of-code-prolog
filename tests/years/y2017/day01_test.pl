:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2017/day01').
:- set_prolog_flag(double_quotes, chars).

run(Pred, I, E) :-
  Tag = '2017/day01',
  '2017/day01':parse(Tag, I, P),
  call(Pred, Tag, P, A),
  (
    A = E, !
  ; format('Expected ~w, but got ~w~n', [E, A]), fail
  ).

:- begin_tests('2017/day01').

test('part1: 1122 => 3') :- run('2017/day01':part1, '1122', 3).
test('part1: 1111 => 4') :- run('2017/day01':part1, '1111', 4).
test('part1: 1234 => 0') :- run('2017/day01':part1, '1234', 0).
test('part1: 91212129 => 9') :- run('2017/day01':part1, '91212129', 9).

test('part2: 1212 => 6') :- run('2017/day01':part2, '1212', 6).
test('part2: 1221 => 0') :- run('2017/day01':part2, '1221', 0).
test('part2: 123425 => 4') :- run('2017/day01':part2, '123425', 4).
test('part2: 123123 => 12') :- run('2017/day01':part2, '123123', 12).
test('part2: 12131415 => 4') :- run('2017/day01':part2, '12131415', 4).

:- end_tests('2017/day01').
