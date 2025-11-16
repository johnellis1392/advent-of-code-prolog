:- use_module('../../src/util/strings').
:- use_module('../test_utils').

:- begin_tests('util/strings').

test(trim, [O == "123"]) :- trim(' 123 ', O).

:- end_tests('util/strings').


