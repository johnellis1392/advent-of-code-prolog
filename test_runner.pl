:- consult('./src/util/os.pl').

run_all_tests :-
  expand_file_name('./tests/years/y*/*.pl', TestFiles),
  maplist(consult, TestFiles),
  run_tests,
  halt.
