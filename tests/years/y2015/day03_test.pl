:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2015/day03').

:- set_prolog_flag(double_quotes, chars).

:- begin_tests(day03).

run(Pred, I, O) :-
  Tag = '2015/day03',
  day03:parse(Tag, I, P),
  call(Pred, Tag, P, O2),
  (O = O2, ! ; format('expected ~w, but got ~w~n', [O, O2]), fail).

test('parse("^>v<") => [^, >, v, <]') :-
  day03:parse('2015/day03', "^>v<", ['^', '>', 'v', '<']).

test('part1: > => 2') :- run(day03:part1, ">", 2).
test('part1: ^>v< => 4') :- run(day03:part1, "^>v<", 4).
test('part1: ^v^v^v^v^v => 2') :- run(day03:part1, "^v^v^v^v^v", 2).

test('part2: ^v => 3') :- run(day03:part2, "^v", 3).
test('part2: ^>v< => 3') :- run(day03:part2, "^>v<", 3).
test('part2: ^v^v^v^v^v => 11') :- run(day03:part2, "^v^v^v^v^v", 11).

:- end_tests(day03).
