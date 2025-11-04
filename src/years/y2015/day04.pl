:- module(day04, []).

:- use_module(library(md5), [md5_hash/3]).
:- use_module(library(clpfd)).
:- use_module('../../aoc').
:- set_prolog_flag(double_quotes, chars).

aoc:parse('2015/day04', Input, ParsedInput) :-
  normalize_space(string(ParsedInput), Input).

% search(Prefix, Seed, Suffix) :-
%   length(SuffixChars, 6),
%   SuffixChars ins 0'0..0'9,
%   label(SuffixChars),
%   atom_chars(Suffix, SuffixChars),
%   atom_concat(Prefix, Suffix, Input),
%   md5_hash(Input, Hash, []),
%   atom_length(Seed, SeedLength),
%   sub_atom(Hash, 0, SeedLength, _, Seed),
%   !.

search(Prefix, Seed, Suffix) :-
  between(100000, 9999999, N),
  % atom_number(Suffix, N),
  format(atom(Suffix), '~d', [N]),
  atom_concat(Prefix, Suffix, Input),
  md5_hash(Input, Hash, []),
  atom_length(Seed, SeedLength),
  sub_atom(Hash, 0, SeedLength, _, Seed),
  !.

aoc:part1('2015/day04', Input, Output) :-
  search(Input, '00000', Output).

aoc:part2('2015/day04', Input, Output) :-
  search(Input, '000000', Output)
  ; writeln('Could not find a solution').

