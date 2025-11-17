:- use_module('../../../src/aoc').
:- use_module('../../../src/years/y2023/day01').
:- use_module('../../test_utils').

:- begin_tests('2023/day01', [setup(nb_setval(tag, '2023/day01')), cleanup(nb_delete(tag))]).

:- set_prolog_flag(double_quotes, chars).

input('1abc2\npqr3stu8vwx\na1b2c3d4e5f\ntreb7uchet').

test(parse, [O == ["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"]]) :-
  input(I), run_parse(I, O).

test(code, [O == 12]) :- code("1abc2", O).

test(part1, [O =:= 142]) :- input(I), run_part1(I, O).

input2('two1nine\neightwothree\nabcone2threexyz\nxtwone3four\n4nineeightseven2\nzoneight234\n7pqrstsixteen').

test(code_parser, [all(O == [[2,1,9]])]) :- phrase(code_parser(O), "two1nine").
test(code_parser, [all(O == [[8,2,3]])]) :- phrase(code_parser(O), "eightwothree").
test(code_parser, [all(O == [[1,2,3]])]) :- phrase(code_parser(O), "abcone2threexyz").
test(code_parser, [all(O == [[2,1,3,4]])]) :- phrase(code_parser(O), "xtwone3four").
test(code_parser, [all(O == [[4,9,8,7,2]])]) :- phrase(code_parser(O), "4nineeightseven2").
test(code_parser, [all(O == [[1,8,2,3,4]])]) :- phrase(code_parser(O), "zoneight234").
test(code_parser, [all(O == [[7,6]])]) :- phrase(code_parser(O), "7pqrstsixteen").

test(part2, [O =:= 281]) :- input2(I), run_part2(I, O).

:- end_tests('2023/day01').
