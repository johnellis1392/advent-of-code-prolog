:- module('util/lists', [filter_map/3, find_subseq/3, reduce/3, reduce/4, scan/3, scan/4]).

filter_map(_, [], []).
filter_map(Pred, [H|T], O) :-
  (
    call(Pred, H, OH) -> filter_map(Pred, T, OT), O = [OH|OT]
  ; filter_map(Pred, T, O)
  ).

find_subseq(List, Sublist, Index) :-
  prefix(Sublist, List), Index = 0, !
  ; append([_], Tail, List),
  find_subseq(Tail, Sublist, Index2),
  Index is Index2 + 1.
  
reduce(Goal, [H|T], O) :- reduce(Goal, T, H, O).
reduce(Goal, [H|T], Acc, O) :-
  call(Goal, Acc, H, Acc2),
  reduce(Goal, T, Acc2, O).
reduce(_, [], O, O).

scan(Goal, [H|T], [H|O]) :- scan(Goal, T, H, O).
scan(Goal, [H|T], Acc, [Acc2|T2]) :-
  call(Goal, H, Acc, Acc2),
  scan(Goal, T, Acc2, T2).
scan(_, [], _, []) :- !.
