:- module(test_utils, [run/4]).
:- use_module('../src/aoc').

run(Pred, Tag, I, E) :-
  aoc:parse(Tag, I, P),
  call(Pred, Tag, P, A),
  (
    A = E, !
  ; format('Expected ~w, but got ~w~n', [E, A]), fail
  ).
