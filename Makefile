.PHONY: test run clean

test:
	@swipl -s tests/years/y2015/day01.pl -g run_tests,halt

run:
	@swipl -s src/main.pl -g run,halt

clean:
	@rm -f *.pl~ */*.pl~
