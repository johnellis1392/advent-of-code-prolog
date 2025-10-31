.PHONY: test run clean

test:
	@swipl -g run_all_tests -f test_runner.pl

run:
	@swipl -s src/main.pl -g run,halt

clean:
	@rm -f *.pl~ */*.pl~
