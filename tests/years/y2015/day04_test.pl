:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2015/day04').

:- set_prolog_flag(double_quotes, chars).

:- begin_tests(day04).

run(Pred, Input, Expected) :-
  Tag = '2015/day04',
  call(Pred, Tag, Input, Actual),
  (
    Expected = Actual, !
  ; format('Expected ~w, but got ~w~n', [Expected, Actual]), fail
  ).

% test('abcdef => 609043') :-
%   Expected = '609043',
%   Input = "abcdef",
%   run(day04:part1, Input, Expected).

:- end_tests(day04).