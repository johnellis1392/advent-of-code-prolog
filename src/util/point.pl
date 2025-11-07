:- module(point, [move/4, range_to/3, manhattan/2, key/2, add/3, normal_slope_to/3, add_all/3, insert/3, remove/3]).
:- use_module('./set', [add_all/3, insert/3, remove/3]).

(point{x:X1,y:Y1}).normal_slope_to(point{x:X2,y:Y2}) := vector{x:VX,y:VY} :-
  VX is sign(X2 - X1), VY is sign(Y2 - Y1).

(point{x:A,y:B}).move(D, N) := point{x:X, y:Y} :-
  ( (D = north) -> Y is (B + N), X is A
  ; (D = south) -> Y is (B - N), X is A
  ; (D = east)  -> Y is B, X is (A + N)
  ; (D = west)  -> Y is B, X is (A - N)).

P.add(vector{x:DX,y:DY}) := point{x:X,y:Y} :-
  X is P.x + DX, Y is P.y + DY.

(P).range_to(P) := [P].
P.range_to(Q) := R :-
  S = P.normal_slope_to(Q),
  P2 = P.add(S),
  R = [P2|P2.range_to(Q)].

P.manhattan() := Dist :- Dist is abs(P.x) + abs(P.y).

P.key() := H :- atomic_list_concat([P.x, ',', P.y], H).

% S.add_all([P|T]) := S2 :- is_dict(P, point), S2 = S.insert(P).add_all(T).
% S.insert(P) := S2 :- is_dict(P, point), S2 = S.put(P.key(), true).
% S.remove(P) := S2 :- is_dict(P, point), del_dict(P.key(), S, true, S2).