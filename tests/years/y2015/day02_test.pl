:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2015/day02').

:- begin_tests(day02).

test('min("[1,2,3] = 1")') :- min([1,2,3], 1).
test('min("[3,2,1] = 1")') :- min([3,2,1], 1).

test('max("[1,2,3] = 3")') :- max([1,2,3], 3).
test('max("[3,2,1] = 3")') :- max([3,2,1], 3).

test('surface_area([2, 3, 4]) = 52') :- surface_area([2, 3, 4], 52).
test('surface_area([1, 1, 10]) = 42') :- surface_area([1, 1, 10], 42).

test('slack([2,3,4]) = 6') :- slack([2,3,4], 6).
test('slack([1,1,10]) = 1') :- slack([1,1,10], 1).

run_part1(I, O) :-
  Tag = '2015/day02',
  day02:parse(Tag, I, S),
  day02:part1(Tag, S, O).

test('part1("2x3x4") = 58') :- run_part1("2x3x4", 58).
test('part1("1x1x10") = 43') :- run_part1("1x1x10", 43).
test('part1("2x3x4\n1x1x10") = 101') :- run_part1("2x3x4\n1x1x10", 101).

test('ribbon_length([2, 3, 4]) = 10') :- ribbon_length([2, 3, 4], 10).
test('ribbon_length([1, 1, 10]) = 4') :- ribbon_length([1, 1, 10], 4).

test('bow_length([2, 3, 4]) = 24') :- bow_length([2, 3, 4], 24).
test('bow_length([1, 1, 10]) = 10') :- bow_length([1, 1, 10], 10).

run_part2(I, O) :-
  Tag = '2015/day02',
  day02:parse(Tag, I, S),
  day02:part2(Tag, S, O).

test('part2("2x3x4") = 34') :- run_part2("2x3x4", 34).
test('part2("1x1x10") = 14') :- run_part2("1x1x10", 14).

:- end_tests(day02).
