:- use_module('../../src/util/dcg').
:- use_module('../test_utils').

:- begin_tests('util/dcg').

:- set_prolog_flag(double_quotes, chars).

test(intseq, [all(O == [[1,2,3]])]) :- phrase(intseq(O), "1\n2\n3").
test(intseq, [all(O == [[1,2,3]])]) :- phrase(intseq(",", O), "1,2,3").

test(sep_by, [all(O == [[1,2,3]])]) :- phrase(sep_by(integer, ",", O), "1,2,3").
test(sep_by, [all(O == [[[1,2,3],[4,5,6]]])]) :- phrase(sep_by(intseq, "\n\n", O), "1\n2\n3\n\n4\n5\n6").

test(lines, [all(O == [["1", "2", "3"]])]) :- phrase(lines(O), "1\n2\n3").

:- end_tests('util/dcg').

