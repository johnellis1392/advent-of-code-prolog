:- module(strings, [tokenize/2, tokenize_safe/2, trim/2]).

tokenize(Input, Chars) :-
  (
    string(Input) -> string_chars(Input, Chars) ;
    atom(Input) -> atom_chars(Input, Chars) ;
    number(Input) -> number_chars(Input, Chars) ;
    throw(error(type_error(convertible, Input), _))
  ).

tokenize_safe(Input, Chars) :-
  catch(
    tokenize(Input, Chars),
    Error,
    (
      format('Error: ~w~n', [Error]),
      fail
    )
  ).

parse_int(I, O) :-
  (
    string(I) -> number_string(O, I)
  ; atom(I) -> string_chars(I, C), number_string(O, C)
  ; is_list(I) -> number_chars(O, I)
  ).

trim(I, O) :-
  split_string(I, '', ' \t\r\n', [O]).
