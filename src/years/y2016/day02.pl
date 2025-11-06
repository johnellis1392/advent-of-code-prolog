:- module('2016/day02', []).

% :- use_module(library(dcg/basics)).
:- use_module(library(clpfd)).
:- use_module('../../util/dcg', [eol/2]).
:- use_module('../../aoc').
:- set_prolog_flag(double_quotes, chars).

aoc:parse('2016/day02', I, P) :- atom_chars(I, P).

% 1 2 3
% 4 5 6
% 7 8 9
grid(point{x:0, y:0}, '1').
grid(point{x:1, y:0}, '2').
grid(point{x:2, y:0}, '3').
grid(point{x:0, y:1}, '4').
grid(point{x:1, y:1}, '5').
grid(point{x:2, y:1}, '6').
grid(point{x:0, y:2}, '7').
grid(point{x:1, y:2}, '8').
grid(point{x:2, y:2}, '9').

parser([C], P) --> [], { grid(P, C) }.
parser([C|S], P) --> "\n", { grid(P, C) }, parser(S, P).
parser(S, P) --> "U", { Y #= max(P.y - 1, 0) }, parser(S, point{x:P.x, y:Y}).
parser(S, P) --> "D", { Y #= min(P.y + 1, 2) }, parser(S, point{x:P.x, y:Y}).
parser(S, P) --> "L", { X #= max(P.x - 1, 0) }, parser(S, point{x:X, y:P.y}).
parser(S, P) --> "R", { X #= min(P.x + 1, 2) }, parser(S, point{x:X, y:P.y}).

aoc:part1('2016/day02', Input, Output) :-
  phrase(parser(N, point{x:1,y:1}), Input), !,
  atom_chars(Output, N).

%     1
%   2 3 4
% 5 6 7 8 9
%   A B C
%     D
grid2(point{x:2, y:0}, '1').
grid2(point{x:1, y:1}, '2').
grid2(point{x:2, y:1}, '3').
grid2(point{x:3, y:1}, '4').
grid2(point{x:0, y:2}, '5').
grid2(point{x:1, y:2}, '6').
grid2(point{x:2, y:2}, '7').
grid2(point{x:3, y:2}, '8').
grid2(point{x:4, y:2}, '9').
grid2(point{x:1, y:3}, 'A').
grid2(point{x:2, y:3}, 'B').
grid2(point{x:3, y:3}, 'C').
grid2(point{x:2, y:4}, 'D').

% Grid bounds-checking
grid_move(P, up, point{x:P.x,y:Y}) :-
  \+ member(P, [point{x:0,y:2}, point{x:1,y:1}, point{x:2,y:0}, point{x:3,y:1}, point{x:4,y:2}]),
  !, Y #= P.y - 1.

grid_move(P, down, point{x:P.x,y:Y}) :-
  \+ member(P, [point{x:0,y:2}, point{x:1,y:3}, point{x:2,y:4}, point{x:3,y:3}, point{x:4,y:2}]),
  !, Y #= P.y + 1.

grid_move(P, left, point{x:X,y:P.y}) :-
  \+ member(P, [point{x:2,y:0}, point{x:1,y:1}, point{x:0,y:2}, point{x:1,y:3}, point{x:2,y:4}]),
  !, X #= P.x - 1.

grid_move(P, right, point{x:X,y:P.y}) :-
  \+ member(P, [point{x:2,y:0}, point{x:3,y:1}, point{x:4,y:2}, point{x:3,y:3}, point{x:2,y:4}]),
  !, X #= P.x + 1.

grid_move(P, _, P).

parser2([C], P) --> [], { grid2(P, C) }.
parser2([C|S], P) --> "\n", { grid2(P, C) }, parser2(S, P).
parser2(S, P0) --> "U", { grid_move(P0, up, P) }, parser2(S, P).
parser2(S, P0) --> "D", { grid_move(P0, down, P) }, parser2(S, P).
parser2(S, P0) --> "L", { grid_move(P0, left, P) }, parser2(S, P).
parser2(S, P0) --> "R", { grid_move(P0, right, P) }, parser2(S, P).

aoc:part2('2016/day02', Input, Output) :-
  phrase(parser2(N, point{x:0, y:2}), Input), !,
  atom_chars(Output, N).
