:- module(dcg, [eol/2, intseq/3, intseq/4, call_dcg/4, sep_by/5]).

:- use_module(library(dcg/basics), [eos/2, integer/3]).
:- set_prolog_flag(double_quotes, chars).

eol --> "\n", !.
eol --> "\r\n", !.
eol --> eos.

call_dcg(Goal, Arg) --> call(Goal, Arg).

intseq([H|T]) --> integer(H), "\n", intseq(T).
intseq([H]) --> !, integer(H).

intseq(Sep, [H|T]) --> integer(H), call_dcg(Sep), intseq(Sep, T).
intseq(_, [H]) --> !, integer(H).

sep_by(Pred, Sep, O) --> sep_by_helper(Pred, Sep, O).
sep_by_helper(Pred, Sep, [H|T]) --> call(Pred, H), !, sep_by_tail(Pred, Sep, T).
sep_by_helper(_, _, []) --> [].

sep_by_tail(Pred, Sep, [H|T]) --> Sep, !, call(Pred, H), sep_by_tail(Pred, Sep, T).
sep_by_tail(_, _, []) --> [].
