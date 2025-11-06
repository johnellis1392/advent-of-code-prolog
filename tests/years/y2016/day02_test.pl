:- use_module('../../../src/years/y2016/day02').

run(P, E) :-
  Tag = '2016/day02',
  I = 'ULL
RRDDD
LURDL
UUUUD',
  '2016/day02':parse(Tag, I, PI),
  call(P, Tag, PI, A),
  writeln('Done.'),
  (
    A = E
  ; format('Expected ~w, but got ~w~n', [E, A])
  ).

:- begin_tests('2016/day02').

test('part1 should return 1985') :- run('2016/day02':part1, '1985').

test('part2 should return 5DB3') :- run('2016/day02':part2, '5DB3').

:- end_tests('2016/day02').
