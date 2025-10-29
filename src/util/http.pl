:- module(http, [download_file/2, download_file_http_get/2]).

:- use_module(library(http/http_client)).
% :- use_module(library(stream)).

download_file(URL, LocalFile) :-
  setup_call_cleanup(
    http_open(URL, In, []),
    setup_call_cleanup(
      open(LocalFile, write, Out),
      copy_stream_data(In, Out),
      close(Out)
    ),
    close(In)
  ),
  format('Downlaoded ~w to ~w~n', [URL, LocalFile]).

% download_file_http_get(URL, File) :-
  % download_file_http_get(URL, File, []).
download_file_http_get(URL, File) :-
  http_get(URL, Data, []),
  open(File, write, Stream),
  write(Stream, Data),
  close(Stream),
  format('Downlaoded ~w to ~w~n', [URL, File]).
