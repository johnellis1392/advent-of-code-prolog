:- module(os, [pwd/0]).

pwd :-
  working_directory(Dir, Dir),
  format('CWD: ~w~n', Dir).
