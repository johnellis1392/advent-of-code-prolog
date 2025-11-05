:- module(main, [run/3, clean_input_dir/0]).

:- use_module(library(http/http_client)).
:- use_module(library(filesex), [ensure_directory/1]).
:- use_module('util/http').
:- use_module('util/strings').
:- use_module('aoc').
:- use_module('util/set').


file_path_for(Year, Day, Path) :-
  valid_year(Year), valid_day(Day), !,
  atomic_list_concat(['day', Day, '.input.txt'], FileName),
  atomic_list_concat(['input', Year, FileName], '/', Path).

dir_path_for(Year, Path) :-
  valid_year(Year),
  atom_concat('./input/', Year, Path).

input_url_for(Year, Day, URL) :-
  format('Year = ~w, Day = ~w~n', [Year, Day]),
  valid_year(Year), valid_day(Day), !,
  Domain = 'https://adventofcode.com',
  strings:parse_int(Day, DayInt),
  atomic_list_concat([Domain, Year, 'day', DayInt, 'input'], '/', URL).

download_input_for_day(Year, Day, SessionId) :-
  input_url_for(Year, Day, URL),
  file_path_for(Year, Day, FilePath),
  dir_path_for(Year, YearDir),
  ensure_directory(YearDir),
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

ensure_file_exists(Year, Day, SessionId, Path) :-
  exists_file(Path) ; download_input_for_day(Year, Day, SessionId).

read_input_for_day(Year, Day, SessionId, Input) :-
  file_path_for(Year, Day, Path),
  format('Reading file ~w~n', [Path]),
  ensure_file_exists(Year, Day, SessionId, Path),
  setup_call_cleanup(
    open(Path, read, Stream),
    read_string(Stream, _, Input),
    close(Stream)
  ).

clean_input_dir :-
  expand_file_name('./input/*/*.input.txt', InputFiles),
  maplist(delete_file, InputFiles).

run(Year, Day, SessionId) :-
  write('Starting application...'), nl,
  read_input_for_day(Year, Day, SessionId, Input),

  atomic_list_concat(['./src/years/y', Year, '/day', Day, '.pl'], FilePath),
  load_files([FilePath], [import([parse/2, part1/2, part2/2])]),

  tag(Year, Day, Tag),
  parse(Tag, Input, ParsedInput),
  part1(Tag, ParsedInput, Part1),
  format('~w, Day ~w, Part 1: ~w~n', [Year, Day, Part1]),
  part2(Tag, ParsedInput, Part2),
  format('~w, Day ~w, Part 2: ~w~n', [Year, Day, Part2]).
