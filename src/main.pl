:- module(main, [run/0]).

:- use_module('years/y2015/day01').
:- use_module('util/http').
:- use_module(library(http/http_client)).

all_years(['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024', '2025']).
all_days(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25' ]).

valid_year(Year) :- all_years(Years), member(Year, Years).
valid_day(Day) :- all_days(Days), member(Day, Days).

file_path_for(Year, Day, Path) :-
  valid_year(Year), valid_day(Day),
  atomic_list_concat(['day', Day, '.input.txt'], FileName),
  atomic_list_concat(['input', Year, FileName], '/', Path).

input_url_for(Year, Day, URL) :-
  valid_year(Year), valid_day(Day),
  Domain = 'https://adventofcode.com',
  atomic_list_concat([Domain, Year, 'day', Day, 'input'], '/', URL).


download_input_for_day(Year, Day, SessionId) :-
  valid_year(Year), valid_day(Day),
  input_url_for(Year, Day, URL),
  file_path_for(Year, Day, FilePath),
  format('URL=~w, FilePath=~w~n', [URL, FilePath]),
  string_concat('session=', SessionId, Cookie),
  format('Cookie: ~w~n', [Cookie]),
  http_get(URL, Data, [
    request_header('Cookie' = Cookie)
  ]),
  open(FilePath, write, Stream),
  write(Stream, Data),
  close(Stream),
  format('Downloaded ~w to ~w~n', [URL, FilePath]).

read_input_for_day(Year, Day, Input) :-
  valid_year(Year), valid_day(Day),
  file_path_for(Year, Day, Path),
  setup_call_cleanup(
    open(Path, read, Stream),
    read_string(Stream, _, Input),
    close(Stream)
  ).

run :-
  write('Starting application...'), nl,
  Year = '2015',
  Day = '1',
  read_input_for_day(Year, Day, Input),
  parse(Input, ParsedInput),
  part1(ParsedInput, Part1),
  part2(ParsedInput, Part2),
  format('~w, Day ~w, Part 1: ~w~n', [Year, Day, Part1]),
  format('~w, Day ~w, Part 2: ~w~n', [Year, Day, Part2]).
  