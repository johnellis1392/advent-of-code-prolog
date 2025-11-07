:- module(set, [add_all/3, insert/3, remove/3, len/2]).

S.add_all([]) := S.
S.add_all([H|T]) := S2 :- S2 = S.insert(H).add_all(T).

S.insert(I) := S2 :- S2 = S.put(I, true).

S.remove(I) := S2 :- del_dict(I, S, true, S2).

S.len() := N :- dict_size(S, N).

% S.contains(I) :- _ = S.get(I).
