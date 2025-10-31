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
