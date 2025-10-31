:- module(aoc, [
  all_years/1,
  all_days/1,
  valid_year/1,
  valid_day/1,
  part1/3,
  part2/3,
  parse/3,
  tag/3
]).

:- multifile part1/3.
:- multifile part2/3.
:- multifile parse/3.

all_years(['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024', '2025']).
all_days(['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25' ]).

tag(Year, Day, Tag) :- atomic_list_concat([Year, '/day', Day], Tag).

valid_year(Year) :- all_years(Years), member(Year, Years).
valid_day(Day) :- all_days(Days), member(Day, Days).
