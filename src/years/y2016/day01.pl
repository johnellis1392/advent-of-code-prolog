:- module('2016/day01', [
  turn/3,
  vec/2,
  vector:mul/3,
  parser/3
]).

:- use_module(library(dcg/basics), [eos/2, integer/3]).
:- use_module('../../aoc').
:- use_module('../../util/point').
:- use_module('../../util/set', [add_all/3, insert/3, remove/3]).
:- set_prolog_flag(double_quotes, chars).

eol --> "\n", !.
eol --> "\r\n", !.
eol --> eos.

turn(right, north, east).
turn(right, east, south).
turn(right, south, west).
turn(right, west, north).
turn(left, east, north).
turn(left, south, east).
turn(left, west, south).
turn(left, north, west).

vec(north, vector{x: 0, y: 1}).
vec(south, vector{x: 0, y: -1}).
vec(east, vector{x: 1, y: 0}).
vec(west, vector{x: -1, y: 0}).

V.mul(N) := vector{x:X,y:Y} :-
  X is V.x * N,
  Y is V.y * N.

parser([]) --> eol, !.
parser(Res) --> ", ", parser(Res).
parser([inst(left, N)|T]) --> "L", integer(N), parser(T).
parser([inst(right, N)|T]) --> "R", integer(N), parser(T).

aoc:parse('2016/day01', Input, ParsedInput) :-
  (
    atom(Input) -> atom_chars(Input, Chars)
  ; string(Input) -> string_chars(Input, Chars)
  ; Chars = Input
  ),
  phrase(parser(ParsedInput), Chars), !.

part1_([], _, Res, Res) :- !.
part1_([inst(Turn, N)|Insts], Dir, P, Res) :-
  turn(Turn, Dir, NewDir),
  P2 = P.move(NewDir, N),
  part1_(Insts, NewDir, P2, Res).

aoc:part1('2016/day01', Input, Output) :-
  part1_(Input, north, point{x:0, y:0}, R),
  Output = R.manhattan().

overlap(_, [], _) :- fail.
overlap(V, [P|_], P) :- _ = V.get(P.key()).
overlap(V, [_|Ps], R) :- overlap(V, Ps, R).

part2_([inst(T, N)|Insts], D, P, V, R) :-
  turn(T, D, D2),
  P2 = P.move(D2, N),
  Path = P.range_to(P2),
  (
    overlap(V, Path, R)
  ; V2 = V.add_all(Path),
    V3 = V2.remove(P2),
    part2_(Insts, D2, P2, V3, R)
  ).

aoc:part2('2016/day01', Input, Output) :-
  part2_(Input, north, point{x:0, y:0}, set{}, R),
  Output = R.manhattan().
