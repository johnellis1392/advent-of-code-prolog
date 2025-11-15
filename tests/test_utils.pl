:- module(test_utils, [run_parse/2, run_part1/2, run_part2/2]).
:- use_module('../src/aoc').

run_parse(I, O) :- nb_getval(tag, T), aoc:parse(T, I, O), !.
run_part1(I, O) :- nb_getval(tag, T), aoc:parse(T, I, P), aoc:part1(T, P, O), !.
run_part2(I, O) :- nb_getval(tag, T), aoc:parse(T, I, P), aoc:part2(T, P, O), !.
