.PHONY: test run clean

years := $(shell seq -w 2015 2025)
days := $(shell seq -w 01 25)

test:
	@swipl -g run_all_tests -f test_runner.pl

run:
	@swipl -s src/main.pl -g "run('2015', '2', '$$SESSION_ID'), halt."

# Template for generating run commands.
define year_day_template
.PHONY: $(1)/day$(2)
$(1)/day$(2):
	@swipl -s src/main.pl -g "run('$(1)', '$(2)', '$$$$SESSION_ID'), halt."
endef

# Generate all year/day combinations for run commands.
$(foreach year,$(years),\
  $(foreach day,$(days),\
    $(eval $(call year_day_template,$(year),$(day)))))

all:
	echo $(years)
	echo $(days)

clean:
	@swipl -s src/main.pl -g 'clean_input_dir, halt.'
	@rm -f *.pl~ */*.pl~

# Template for a new solution file for the given year/day combination.
define solution_template
:- module('$(1)/day$(2)', []).\n\n:- use_module('../../aoc').\n\naoc:parse('$(1)/day$(2)', _Input, _ParsedInput).\n\naoc:part1('$(1)/day$(2)', _Input, _Output).\n\naoc:part2('$(1)/day$(2)', _Input, _Output).\n
endef

# Template for a new test file for the given year/day combination.
define test_template
:- use_module('../../../src/aoc').\n:- use_module('../../../src/years/y$(1)/day$(2)').\n:- use_module('../../test_utils').\n\n:- begin_tests('$(1)/day$(2)', [setup(nb_setval(tag, '$(1)/day$(2)')), cleanup(nb_delete(tag))]).\n\n:- end_tests('$(1)/day$(2)').\n
endef

define init_solution_template
init/$(1)/day$(2):
	@if [ ! -e ./src/years/y$(1)/day$(2).pl ]; then echo "$$(call solution_template,$(1),$(2))" | tee ./src/years/y$(1)/day$(2).pl; fi
	@if [ ! -e ./tests/years/y$(1)/day$(2)_test.pl ]; then echo "$$(call test_template,$(1),$(2))" | tee ./tests/years/y$(1)/day$(2)_test.pl; fi
endef

# Generate template commands for creating new src/test files from templates
$(foreach year,$(years),\
  $(foreach day,$(days),\
    $(eval $(call init_solution_template,$(year),$(day)))))
