:- module('util/lists', [filter_map/3]).

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
  
