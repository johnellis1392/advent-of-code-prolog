:- use_module('../../src/util/lists').
:- use_module('../test_utils').

:- begin_tests('util/lists').

:- set_prolog_flag(double_quotes, chars).

test(filter_map, [all(O == [[1, 2]])]) :- filter_map(atom_number, "1abc2", O).

test(find_subseq, [O =:= 1]) :- find_subseq("1abc2", "abc", O).
test(find_subseq, [fail]) :- find_subseq("1abc2", "456", _).

test(reduce, [all(O == [6])]) :- reduce([A, X, Y]>>(Y is A + X), [1, 2, 3], O).
test(reduce, [all(O == [6])]) :- reduce([A, X, Y]>>(Y is A * X), [1, 2, 3], O).

test(scan, [all(O == [[1, 3, 6]])]) :- scan([A, X, Y]>>(Y is A + X), [1, 2, 3], O).

:- end_tests('util/lists').
