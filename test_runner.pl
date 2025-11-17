:- use_module('./src/util/os').
:- use_module('./src/aoc').

% :- dynamic parse/2.
% :- dynamic part1/2.
% :- dynamic part2/2.

load_year_tests :-
  expand_file_name('./tests/years/y*/*.pl', TestFiles),
  maplist(consult, TestFiles).

load_util_tests :-
  expand_file_name('./tests/util/*.pl', TestFiles),
  maplist(consult, TestFiles).

run_all_tests :-
  load_year_tests,
  load_util_tests,
  run_tests(_, [verbose(true)]),
  halt.

% run_tests_for(_, []).
% run_tests_for(Year, [Day|Days]) :-
%   atomic_list_concat(['./tests/years/y', Year, '/day', Day, '_test.pl'], Path),
%   exists_file(Path),
%   load_files([Path], [import([parse/2, part1/2, part2/2])]),
%   run_tests,
%   unload_file(Path),
%   !, run_tests_for(Year, Days).

% run_tests_for([]).
% run_tests_for([Year|Years]) :-
%   all_days(Days),
%   run_tests_for(Year, Days),
%   !, run_tests_for(Years).

% run_all_tests :- 
%   all_years(Years),
%   run_tests_for(Years),
%   halt.
