:- module(set, [add_all/3, insert/3, remove/3]).

:- use_module('./point', [key/2]).

S.add_all([]) := S.
S.add_all([P|T]) := S2 :- S2 = S.insert(P).add_all(T).

S.insert(P) := S2 :- S2 = S.put(P.key(), true).

S.remove(P) := S2 :- del_dict(P.key(), S, true, S2).
