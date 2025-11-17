:- use_module('../../src/util/strings').
:- use_module('../test_utils').

:- begin_tests('util/strings').

test(trim, [O == "123"]) :- trim(' 123 ', O).

test(lines, [all(O == [[['1'], ['2'], ['3']]])]) :- lines("1\n2\n3", O).
test(lines, [all(O == [[['1'], ['2'], ['3']]])]) :- lines('1\n2\n3', O).

:- end_tests('util/strings').


