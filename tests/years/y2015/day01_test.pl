:- use_module('../../../src/years/y2015/day01').

:- begin_tests(day01).

run_part1(Input, Output) :-
  parse(Input, ParsedInput),
  part1(ParsedInput, Output).

test('part1("(((") = 3') :- run_part1('(((', 3).
test('part1(")))") = -3') :- run_part1(')))', -3).
test('part1("()()()") = 0') :- run_part1('()()()', 0).
test('part1("((())") = 1') :- run_part1('((())', 1).

run_part2(Input, Output) :-
  parse(Input, ParsedInput),
  part2(ParsedInput, Output).

test('part2("((())))") = 7') :- run_part2('((())))', 7).

:- end_tests(day01).
