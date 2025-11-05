:- module(point, [move/4, range_to/3, manhattan/2, key/2, add/3, normal_slope_to/3]).

(point{x:X1,y:Y1}).normal_slope_to(point{x:X2,y:Y2}) := vector{x:VX,y:VY} :-
  VX is sign(X2 - X1), VY is sign(Y2 - Y1).

(point{x:A,y:B}).move(D, N) := point{x:X, y:Y} :-
  ( (D = north) -> Y is (B + N), X is A
  ; (D = south) -> Y is (B - N), X is A
  ; (D = east)  -> Y is B, X is (A + N)
  ; (D = west)  -> Y is B, X is (A - N)).

% (point{x:X1,y:Y}).range_to(point{x:X2,y:Y}) := R :-
%   A is min(X1, X2), B is max(X1, X2),
%   findall(I, between(A, B, I), Xs),
%   maplist({Y}/[X, point{x:X, y:Y}]>>true, Xs, R).

% (point{x:X,y:Y1}).range_to(point{x:X,y:Y2}) := R :-
%   A is min(Y1, Y2), B is max(Y1, Y2),
%   findall(I, between(A, B, I), Ys),
%   maplist({X}/[Y, point{x:X, y:Y}]>>true, Ys, R).

P.add(vector{x:DX,y:DY}) := point{x:X,y:Y} :-
  X is P.x + DX, Y is P.y + DY.

(P).range_to(P) := [P].
P.range_to(Q) := R :-
  S = P.normal_slope_to(Q),
  P2 = P.add(S),
  R = [P2|P2.range_to(Q)].

P.manhattan() := Dist :- Dist is abs(P.x) + abs(P.y).

P.key() := H :- atomic_list_concat([P.x, ',', P.y], H).
